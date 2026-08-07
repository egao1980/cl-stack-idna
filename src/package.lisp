(defpackage #:cl-stack-idna
  (:use #:cl)
  (:nicknames #:stack-idna)
  (:export #:to-ascii
           #:to-unicode
           #:idna-map
           #:idna-error)
  (:documentation "Stack-owned IDNA facade. Prefer this over Ultralisp cl-idna for new stack code."))

(in-package #:cl-stack-idna)

(define-condition idna-error (unicode-protocol:unicode-idna-error) ()
  (:documentation "Alias of UNICODE-PROTOCOL:UNICODE-IDNA-ERROR for cl-idna-shaped catch sites."))
