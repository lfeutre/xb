(defmodule unit-xb-util-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest checksum
  (is-equal #xff (xb-util:checksum #B(0 1 0 0 0 0 0 0 0 0 0 254)))
  (is-equal #xff (xb-util:checksum #B(1 1 1 1 0 0 1 0 1 0 1 248))))

(deftest str->bin
  (is-equal
    #B(126 0 11 0 1 0 0 0 0 0 0 0 0 0 254)
    (xb-util:str->bin "7E 00 0B 00 01 00 00 00 00 00 00 00 00 00 FE"))
  (is-equal
    #B(126 0 14 0 1 160 0 0 0 0 0 255 255 0 222 219 239 184)
    (xb-util:str->bin "7E 00 0E 00 01 A0 00 00 00 00 00 FF FF 00 DE DB EF B8")))
