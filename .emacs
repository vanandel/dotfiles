(add-to-list 'load-path "." )
(add-to-list 'load-path "~/emacs")
;;(setq load-path (append(list "." "~/emacs") load-path))
(setq debug-on-error 1)

(setq viper-mode t)
(require 'viper)
;; (add-to-list 'load-path "~/ctm_lisp")
(setq cursor-type 'box)
(setq-default cursor-type 'box)
(setq-default cursor-color "Red")
(setq-default viper-vi-state-cursor-color "Red")
(setq-default viper-saved-cursor-color-in-replace-mode "Red")
(blink-cursor-mode)
(setq-default blink-cursor-blinks 0)

(require 'linum)

;; (require 'magit)


;;(load-file "~/ctm_lisp/cedet-1.0/common/cedet.el")
;; (global-ede-mode t)
;;(semantic-load-enable-excessive-code-helpers)
;;(require 'semantic-ia)
;;(require 'semantic-gcc)

;;(add-to-list 'load-path "~/ctm_lisp/ecb-2.40")
;; (require 'ecb)


;; Default mode
(setq default-major-mode 'text-mode)
;; use meta-q to refill paragraph to column 70
(setq default-fill-column 70)

;; Disallow tabs to be used instead of spaces (implicitly)
(setq-default indent-tabs-mode nil)
(setq column-number-mode t)

;; C/C++ Formatting (also applies to java)
;; (setq c++-indent-level 2)
;; (setq c++-continued-statement-offset 2)
;; (setq c++-brace-offset -2)
;; (setq c++-continued-brace-offset -2)
;; (setq c++-argdecl-indent 2)
;; (setq c++-label-offset -2)
;; (setq c++-auto-newline nil)
;; (setq c++-electric-colon nil)
;; (setq c++-default-fill-column 80)

(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hh$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.C\\'" . c++-mode))

(add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
(add-to-list 'auto-mode-alist '("SConscript" . python-mode))


;; Java Formatting
(setq java-indent-level 2)
(setq java-continued-statement-offset 2)
(setq java-brace-offset -2)
(setq java-continued-brace-offset -2)
(setq java-argdecl-indent 2)
(setq java-label-offset -2)
(setq java-auto-newline nil)
(setq java-electric-colon nil)
(setq java-default-fill-column 80)
(defun faa-c-mode-common-hook ()
      ;; use bsd style for all C like languages
      (c-set-style "bsd")
      (setq c-basic-offset 2)
      ;; other customizations can go here
      )
(add-hook 'c-mode-common-hook 'faa-c-mode-common-hook)

;; NOT used - saved for reference
(defun my-c-mode-common-hook() 
 (setq c-basic-offset 2)
 (setq c-auto-newline nil)
 (c-set-offset 'member-init-intro 8)
 (c-set-offset 'case-label 2)
 (c-set-offset 'topmost-intro-cont 2)
 (c-set-offset 'arglist-intro 8)
 (c-set-offset 'substatement-open 0)

  ;; offset customizations not in my-c-style

  (c-set-offset 'member-init-intro '++)

  ;; other customizations

(setq tab-width 8)

;; this will make sure spaces are used instead of tabs

(setq-default	indent-tabs-mode nil)

  ;; we like auto-newline and hungry-delete

  (c-toggle-auto-hungry-state 1)

  ;; keybindings for all supported languages.  We can put these in

  ;; c-mode-base-map because c-mode-map, c++-mode-map, objc-mode-map,
  ;; java-mode-map, and idl-mode-map inherit from it.

  (define-key c-mode-base-map "\C-m" 'newline-and-indent)
    (setq c-basic-offset 2)

;; other customizations can go here
)

;; set mode for C, C++, Java
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(setq my-c-mode-common-hook
          '(lambda ()
              (gtags-mode 1)
		)
)
;;
;;;; [Setting to use vi style scroll key]
;;;;;
(add-hook 'gtags-mode-hook
'(lambda ()
(define-key gtags-mode-map "\C-f" 'scroll-up)
(define-key gtags-mode-map "\C-b" 'scroll-down)
))
;;;;;
;;;;; [Setting to make 'Gtags select mode' easy to see]
;;;;;
(add-hook 'gtags-select-mode-hook
'(lambda ()
(setq hl-line-face 'underline)
(hl-line-mode 1)
))
(setq gtags-suggested-key-mapping t)
(setq gtags-auto-update t)
(defalias 'gft 'gtags-find-tag)
(defalias 'gftr 'gtags-find-rtag)

;; ack support
(add-to-list 'load-path "~/emacs/ack-and-a-half") 
(autoload 'ack-and-a-half-same "ack-and-a-half" nil t)
(autoload 'ack-and-a-half "ack-and-a-half" nil t)
(autoload 'ack-and-a-half-find-file-samee "ack-and-a-half" nil t)
(autoload 'ack-and-a-half-find-file "ack-and-a-half" nil t)
;; Create shorter aliases
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)



;; Python mode with vi
(defun my-python-mode-hook()
;;  (setq indent-tabs-mode nil)
  (setq py-indent-offset 4)
  (setq py-smart-indentation 4)
;;  (viper-mode)
)
(add-hook 'python-mode-hook 'my-python-mode-hook)

;; autoload my personal extensions

(autoload 'gid "idutils" nil t)
(autoload 'gtags-mode "gtags" "" t)

(load-file "~/emacs/func-keys.el")

;; don't be fooled by symbolic links
(setq find-file-compare-true-names t)
(viper-mode)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "green" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "DejaVu Sans")))))
