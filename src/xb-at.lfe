(defmodule xb-at
  (export all))

(defun api-id () #x08)

(defun send
  ((command) (when (is_atom command))
   (logjam:debug (MODULE) 'send/2 "Got atom, converting to sirng ...")
   (xb-at:send (atom_to_list command)))
  ((command)
   (let* ((frame-id (xb:get-frame-id))
          (payload `(,frame-id ,command)))
     (logjam:debug (MODULE)
                   'send/2
                   "API: ~p, Frame ID: ~p, Command: ~p"
                   `(,(api-id) ,frame-id ,command))
      (xb:send (api-id) (binary payload)))))

(defun send (command param)
  'noop)