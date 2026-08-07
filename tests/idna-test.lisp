(in-package #:cl-stack-idna/tests)

(deftest to-ascii-buecher
  (ok (string= (to-ascii "bücher.de") "xn--bcher-kva.de")))

(deftest to-unicode-roundtrip
  (ok (string= (to-unicode (to-ascii "bücher.de")) "bücher.de")))

(deftest ascii-passthrough
  (ok (string= (to-ascii "example.com") "example.com")))
