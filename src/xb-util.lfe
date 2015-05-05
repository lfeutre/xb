(defmodule xb-util
  (export all))

(defun get-version ()
  (lutil:get-app-version 'xb))

(defun get-versions ()
  (++ (lutil:get-versions)
      `(#(xb ,(get-version)))))

(defun checksum (bin)
  (checksum bin 0))

(defun checksum
  (((binary (x integer (size 8)) (rest bytes)) acc)
   (checksum rest (+ acc x)))
  (((binary) acc)
   (band acc #xff)))
