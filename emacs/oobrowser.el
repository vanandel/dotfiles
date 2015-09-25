;; OO-Browser setup

; Let's just enable browsing for C++ and Python
; for full list of languages, see br-env.el
(defvar br-env-lang-avector
    '[ ("Python"  . "python-")
    ("C++"     . "c++-")
    ("Java"    . "java-") ]
  "Association vector of (LANGUAGE-NAME . LANGUAGE-PREFIX-STRING) elements of OO-Browser languages.")
(require 'python-browse)

