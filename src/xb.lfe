(defmodule xb
  (export all))

(defun parse-package
 (((binary #x7e (len integer (size 16)) (rest bytes)))
   (parse-frame rest))
 ((packet)
  #(error packet)))

;; XXX need to do a check some soon
(defun parse-frame (frame-data)
  #(ok not-implemented))
