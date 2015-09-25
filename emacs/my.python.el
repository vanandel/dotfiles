i;;  (autoload 'python-mode "python-mode" "Python editing mode." t)
;;  (setq auto-mode-alist
 ;;       (cons '("\\.py$" . python-mode) auto-mode-alist))

;; (add-hook 'python-mode-hook 'turn-on-font-lock)


;; Set up python modes (adapted from Rich Neitzel)

(defconst python-keywords '("import" "from" "def" "class" "exec" "global" "del"
                            "pass" "if" "while" "for" "in" "try" "except"
                            "finally" "raise" "and" "or" "not" "return" "print"
                            "else" "elif" "break" "continue" "access" "is")
  "Keywords in python-mode.")
(defconst python-font-lock-keywords
  (list '("\\bdef\\s +\\(\\sw+\\)(" 1 font-lock-function-name-face)
        '("\\bclass\\s +\\(\\sw+\\)[(:]" 1 font-lock-function-name-face)
        (cons (concat "\\(\\<"
                      (mapconcat 'identity python-keywords "\\>\\|\\<")
                      "\\>\\)")
              1)
        )
  "Expressions to highlight in Python buffers.")
(add-hook 'font-lock-mode-hook
          '(lambda ()
             (cond ((eq major-mode 'python-mode)
                    (set (make-local-variable 'font-lock-keywords)
                         python-font-lock-keywords)))
             ))
(add-hook 'py-mode-hook 'turn-on-font-lock)
