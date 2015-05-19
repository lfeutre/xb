(defmodule xb
  (export all))

(include-lib "lutil/include/compose.lfe")
(include-lib "lutil/include/predicates.lfe")

(defun api-id () #xff)

(defun start ()
  (cereal:start))

(defun open (filename)
  (cereal:open filename))

(defun open (filename opts)
  (cereal:open filename opts))

(defun raw-send (bin-data)
  (cereal:send bin-data))

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
  ((api-id (match-frame payload paylod))
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
      (cereal:send)))

(defun close ()
  (cereal:close))

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
