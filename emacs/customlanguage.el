(setq auto-mode-alist 
      (mapcar 'purecopy
              '(("\\.text$" . text-mode)
                ("\\.c$" . c-mode)
                ("\\.h$" . c-mode)
                ("\\.cc$" . c++-mode)
                ("\\.cpp$" . c++-mode)
                ("\\.H$" . c++-mode)
                ("\\.hh$" . c++-mode)
                ("\\.Ph$" . c++-mode)
                ("\\.C$"  . c++-mode)
                ("\\.tcl$"  . tcl-mode)
                ;; Less common extensions come here
                ;; so more common ones above are found faster.
                ("\\.py$" . python-mode)
                ("\\.f$" . fortran-mode)
                ("\\.mss$" . scribe-mode)
                ("\\.pl$" . prolog-mode)
                ("\\.tex$" . TeX-mode)
                ("\\.el$" . emacs-lisp-mode)
                ("\\.scm$" . scheme-mode)
                ("\\.l$" . lisp-mode)
                ("\\.lisp$" . lisp-mode)
                ("\\.TeX$" . TeX-mode)
                ("\\.sty$" . LaTeX-mode)
                ("\\.bbl$" . LaTeX-mode)
                ("\\.bib$" . text-mode)
                ("\\.article$" . text-mode)
                ("\\.letter$" . text-mode)
                ("\\.texinfo$" . texinfo-mode)
                ("\\.lsp$" . lisp-mode)
                ("\\.prolog$" . prolog-mode)
                ("^/tmp/Re" . text-mode)
                ;; some news reader is reported to use this
                ("^/tmp/fol/" . text-mode)
                ("/Message[0-9]*$" . text-mode)
                ("\\.y$" . c-mode)
                ("\\.scm.[0-9]*$" . scheme-mode)
                ;; .emacs following a directory delimiter
                ;; in either Unix or VMS syntax.
                ("[]>:/]\\..*emacs" . emacs-lisp-mode)
                ("\\.ml$" . lisp-mode))))

(require 'cc-mode)


;; the customization interface doesn't seem to let me set 'k&r' as of
; ;20.3, so I'll do it myself.
;

;; (defconst my-c-style

;;   '((c-tab-always-indent        . t)

;;     (c-comment-only-line-offset . 0)

;;     (c-hanging-braces-alist     . ((substatement-open after)
;;                                    (brace-list-open)))

;;     (c-hanging-colons-alist     . ((member-init-intro before)
;;                                    (inher-intro)
;;                                    (case-label after)
;;                                    (label after)
;;                                    (access-label after)))

;;     (c-cleanup-list             . (scope-operator
;;                                    empty-defun-braces
;;                                    defun-close-semi))

;;      (c-offsets-alist . ((statement-block-intro . +)
;; 			 (knr-argdecl-intro . 0)
;; 			 (substatement-open . 0)
;; 			 (label . 0)
;; 			 (statement-cont . +)
;; 			 (arglist-cont-nonempty . 4)
;; 			 ))


;;     (c-echo-syntactic-information-p . t)
;;     )
;;  "My C Programming Style")

(defun my-c-mode-common-hook() 
    ;; add my personal style and set it for the current buffer
;;    (c-add-style "PERSONAL" my-c-style t)
;; (setq c-default-style 'PERSONAL)
;;  (setq c-default-style 'linux)

  ;; offset customizations not in my-c-style

  (c-set-offset 'member-init-intro '++)

  ;; other customizations

  (setq tab-width 8

        ;; this will make sure spaces are used instead of tabs

	indent-tabs-mode nil)

  ;; we like auto-newline and hungry-delete

  (c-toggle-auto-hungry-state 1)

  ;; keybindings for all supported languages.  We can put these in

  ;; c-mode-base-map because c-mode-map, c++-mode-map, objc-mode-map,
  ;; java-mode-map, and idl-mode-map inherit from it.

  (define-key c-mode-base-map "\C-m" 'newline-and-indent)
    (setq c-basic-offset 4)

;; other customizations can go here
)

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; Python mode with vi
(defun my-python-mode-hook()
;;  (setq indent-tabs-mode nil)
  (setq py-indent-offset 4)
  (setq py-smart-indentation 4)
  (viper-mode)
)
(add-hook 'python-mode-hook 'my-python-mode-hook)
