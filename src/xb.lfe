(defmodule xb
  (export all))

(defun parse-package
 (((binary #x7e (len integer (size 16)) (rest bytes)))
   (parse-frame rest))
 ((packet)
  #(error packet)))

;; XXX need to do a checksum ... the sooner in the process, the better
(defun parse-frame (frame-data)
  #(ok not-implemented))
