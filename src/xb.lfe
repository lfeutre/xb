(defmodule xb
  (behaviour gen_server)
  (export all))

(include-lib "lutil/include/compose.lfe")
(include-lib "lutil/include/predicates.lfe")
(include-lib "xb/include/records.lfe")

;;; constants

(defun api-id () #xff)

;;; gen_server config functions

(defun server-name () (MODULE))
(defun callback-module () (MODULE))
(defun initial-state () (make-xb-state))
(defun genserver-opts () '())
(defun register-name () `#(local ,(server-name)))
(defun unknown-command () #(error "Unknown command."))

;;; gen_server implementation
;;;
;;; Note that the gen_server for xb is used just to manage
;;; state between calls to the underlying serial library.

(defun start ()
  (cereal:start)
  (gen_server:start (register-name)
                    (callback-module)
                    (initial-state)
                    (genserver-opts)))

(defun stop ()
  (close)
  (gen_server:call (server-name) 'stop))

;;; callback implementation

(defun init (initial-state)
  `#(ok ,initial-state))

(defun handle_cast
  (('frame-id state-data)
    `#(noreply ,(inc-frame-id state-data))))

(defun handle_call
  (('frame-id _caller state-data)
    `#(reply ,(get-frame-id state-data) ,state-data))
  (('stop _caller state-data)
    `#(stop shutdown ok state-data))
  ((message _caller state-data)
    `#(reply ,(unknown-command) ,state-data)))

(defun handle_info
  ((`#(EXIT ,_pid normal) state-data)
   `#(noreply ,state-data))
  ((`#(EXIT ,pid ,reason) state-data)
   (io:format "Process ~p exited! (Reason: ~p)~n" `(,pid ,reason))
   `#(noreply ,state-data))
  ((_msg state-data)
   `#(noreply ,state-data)))

(defun terminate (_reason _state-data)
  'ok)

(defun code_change (_old-version state _extra)
  `#(ok ,state))

;;; gen_server server API

(defun inc-frame-id ()
  (gen_server:cast (server-name) 'frame-id))

(defun get-frame-id ()
  (gen_server:call (server-name) 'frame-id))

;;; serial library wrapper functions

(defun open (filename)
  (cereal:open filename))

(defun open (filename opts)
  (cereal:open filename opts))

(defun close ()
  (cereal:close))

(defun raw-send (bin-data)
  (prog1
   (cereal:send bin-data)
   (inc-frame-id)))

(defun send (data)
  (xb:send (api-id) data))

(defun send (api-id data)
  (cond ((proplist? data) (plist-send api-id data))
        ((record? data 'frame) (rec-send api-id data))
        ((list? data) (list-send api-id data))
        ((binary? data) (bin-send api-id data))))

(defun plist-send (api-id data)
  (list-send api-id (proplists:get_value 'payload data)))

(defun rec-send
  ((api-id (match-frame payload payload))
   (bin-send api-id payload)))

(defun list-send (api-id data)
  (bin-send api-id (list_to_binary data)))

(defun bin-send (api-id payload)
  (logjam:debug (MODULE)
                'bin-send/2
                "Frame: ~p" `(,(-> (binary api-id)
                                   (xb-util:cons-frame payload))))
  (-> (binary api-id)
      (xb-util:cons-frame payload)
      (prog1
        (cereal:send)
        (inc-frame-id))))

;;; frame-parsing functions

(defun decons-frame
  (((binary #x7e (len integer (size 16)) (rest bytes)))
   (++ `(#(delimiter #x7e)
         #(length ,len))
       (parse-payload rest)))
 ((frame)
  `#(error #(description "Unsuccessful binary match on frame.")
           #(data ,frame))))

;; XXX need to do a checksum ... the sooner in the process, the better
(defun parse-payload (data)
  (let ((api (xb-util:bcar data))
        (payload (xb-util:bmdr data))
        (cksum (xb-util:bldr data)))
    (if (xb-util:verify api payload cksum)
        `(#(api ,api)
          #(payload ,payload)
          #(checksum ,cksum))
        `#(error #(description "Checksums did not match.")
                 #(data ,data)))))

;;; record utility functions

(defun set-frame-id (frame-id state-data)
  (set-xb-state-frame-id state-data frame-id))

(defun inc-frame-id (state-data)
  (-> (xb-state-frame-id state-data)
      (erlang:rem #xff)
      (+ 1)
      (set-frame-id state-data)))

(defun get-frame-id (data)
  (xb-state-frame-id data))