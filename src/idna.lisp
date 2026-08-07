(in-package #:cl-stack-idna)

;;; Compatible surface with egao1980/cl-idna, backed by unicode-protocol.
;;; Does NOT shadow or redefine the Ultralisp cl-idna system.

(defun %options (&key transitional-processing-p
                   (use-std3-ascii-rules-p t)
                   (check-hyphens-p t)
                   check-bidi-p check-joiners-p)
  (declare (ignore check-bidi-p check-joiners-p))
  (append (when transitional-processing-p (list :transitional))
          (unless use-std3-ascii-rules-p (list :no-std3))
          (unless check-hyphens-p (list :no-check-hyphens))))

(defun to-ascii (string &key transitional-processing-p
                          (use-std3-ascii-rules-p t)
                          (check-hyphens-p t)
                          (check-bidi-p t)
                          (check-joiners-p t))
  "Encode STRING with IDNA2008 / UTS #46 ToASCII (unicode-protocol backend)."
  (unicode-protocol:idna-name-to-ascii
   string
   :options (%options :transitional-processing-p transitional-processing-p
                      :use-std3-ascii-rules-p use-std3-ascii-rules-p
                      :check-hyphens-p check-hyphens-p
                      :check-bidi-p check-bidi-p
                      :check-joiners-p check-joiners-p)))

(defun to-unicode (string &key transitional-processing-p
                            (use-std3-ascii-rules-p t)
                            (check-hyphens-p t)
                            (check-bidi-p t)
                            (check-joiners-p t))
  "Decode STRING with IDNA2008 / UTS #46 ToUnicode (unicode-protocol backend)."
  (unicode-protocol:idna-name-to-unicode
   string
   :options (%options :transitional-processing-p transitional-processing-p
                      :use-std3-ascii-rules-p use-std3-ascii-rules-p
                      :check-hyphens-p check-hyphens-p
                      :check-bidi-p check-bidi-p
                      :check-joiners-p check-joiners-p)))

(defun idna-map (name &key transitional-processing-p (use-std3-ascii-rules-p t))
  "UTS #46 mapping step only → string."
  (unicode-protocol:idna-map
   name
   :transitional transitional-processing-p
   :std3 use-std3-ascii-rules-p))
