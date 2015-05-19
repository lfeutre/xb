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
  "Calculate the checksum."
  (((binary (x integer (size 8)) (rest bytes)) acc)
   (checksum rest (+ acc x)))
  (((binary) acc)
   (- #xff (band acc #xff))))

(defun verify (data sum)
  (=:= (checksum data) sum))

(defun verify (api payload sum)
  (verify (binary (api binary) (payload binary)) sum))

(defun str->bin (data-str)
  (list_to_binary
    (lists:map
      (lambda (x)
        (list_to_integer x 16))
      (string:tokens data-str " "))))

(defun cons-frame (api payload)
  (let* ((delim (binary #x7e))
         (api-payload (binary (api binary) (payload binary)))
         (len (binary ((byte_size api-payload) (size 16))))
         (cksum (checksum api-payload)))
    (binary (delim binary)
            (len binary)
            (api-payload binary)
            cksum)))

(defun bcar (data)
  "Get the first item in the binary."
  (binary:part data 0 1))

(defun bcdr (data)
  "Get the rest of the binary."
  (binary:part data 1 (- (byte_size data) 1)))

(defun bldr (data)
  "Get the last item in the binary.

  'ldr' is a play on 'cdr', for 'Last of the Decrement part of Register
  number."
  (binary:part data `#(,(byte_size data) -1)))

(defun babl (data)
  "Get All But Last for the given binary."
  (binary:part data 0 (- (byte_size data) 1)))

(defun bmdr (data)
  "Get the middle bits (all but first and last).

  'mdr' is a play on 'cdr', for 'Middle of the Decrement part of Register
  number."
  (binary:part data 1 (- (byte_size data) 2)))