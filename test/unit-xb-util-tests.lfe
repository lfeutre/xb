(defmodule unit-xb-util-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest checksum
  (is-equal #xff (xb-util:checksum #B(0 1 0 0 0 0 0 0 0 0 0 254)))
  (is-equal #xff (xb-util:checksum #B(1 1 1 1 0 0 1 0 1 0 1 248))))
