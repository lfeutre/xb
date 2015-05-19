(defmodule xb-at
  (export all))

(defun api-id () #x08)

(defun send
  ((frame-id command) (when (is_atom command))
   (logjam:debug (MODULE) 'send/2 "Got atom, converting to sirng ...")
   (xb-at:send frame-id (atom_to_list command)))
  ((frame-id command)
   (let ((frame-id (+ 1 (erlang:rem frame-id #xff))))
     (logjam:debug (MODULE)
                   'send/2
                   "API: ~p, Frame ID: ~p, Command: ~p"
                   `(,(api-id) ,frame-id ,command))
     (xb:send (api-id) (list_to_binary `(,frame-id ,command))))))

(defun send (frame-id command param)
  'noop)