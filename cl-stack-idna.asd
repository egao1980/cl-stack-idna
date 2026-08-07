(defsystem "cl-stack-idna"
  :version "0.1.0"
  :description "Stack IDNA2008 / UTS #46 facade over unicode-protocol (does not replace Ultralisp cl-idna)"
  :author "egao1980"
  :license "MIT"
  :depends-on ("unicode-protocol" "unicode-backend-cl-unicode")
  :serial t
  :pathname "src"
  :components ((:file "package")
               (:file "idna"))
  :in-order-to ((test-op (test-op "cl-stack-idna/tests"))))

(defsystem "cl-stack-idna/tests"
  :depends-on ("cl-stack-idna" "rove")
  :pathname "tests"
  :serial t
  :components ((:file "package")
               (:file "idna-test"))
  :perform (test-op (o c)
             (unless (symbol-call :rove :run c)
               (error "tests failed for ~A" (component-name c)))))
