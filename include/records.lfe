(defrecord xb-state
  (frame-id 1))

(defrecord frame
  (delimiter #x7e)
  length
  api
  payload
  checksum)