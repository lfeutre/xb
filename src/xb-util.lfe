(defmodule xb-util
  (export all))

(defun get-version ()
  (lutil:get-app-version 'xb))

(defun get-versions ()
  (++ (lutil:get-versions)
      `(#(xb ,(get-version)))))
