(setq viper-mode t)
(require 'viper)

;; Default mode
(setq default-major-mode 'text-mode)
;; use meta-q to refill paragraph to column 70
(setq default-fill-column 70)

;; Disallow tabs to be used instead of spaces (implicitly)
(setq-default indent-tabs-mode nil)
(setq column-number-mode t)

;; C/C++ Formatting (also applies to java)
(setq c++-indent-level 4)
(setq c++-continued-statement-offset 4)
(setq c++-brace-offset -4)
(setq c++-continued-brace-offset -4)
(setq c++-argdecl-indent 4)
(setq c++-label-offset -4)
(setq c++-auto-newline nil)
(setq c++-electric-colon nil)
(setq c++-default-fill-column 80)

;; Java Formatting
(setq java-indent-level 4)
(setq java-continued-statement-offset 4)
(setq java-brace-offset -4)
(setq java-continued-brace-offset -4)
(setq java-argdecl-indent 4)
(setq java-label-offset -4)
(setq java-auto-newline nil)
(setq java-electric-colon nil)
(setq java-default-fill-column 80)
(defun faa-c-mode-common-hook ()
      ;; use bsd style for all C like languages
      (c-set-style "bsd")
      (setq c-basic-offset 4)
      ;; other customizations can go here
 (setq c-auto-newline nil)
 (c-set-offset 'member-init-intro 4)
 (c-set-offset 'case-label 4)
 (c-set-offset 'topmost-intro-cont 4)
 (c-set-offset 'arglist-intro 4)
 (c-set-offset 'substatement-open 0)
      )
(add-hook 'c-mode-common-hook 'faa-c-mode-common-hook)

(defun my-c-mode-common-hook() 
 (setq c-basic-offset 4)
 (setq c-auto-newline nil)
 (c-set-offset 'member-init-intro 4)
 (c-set-offset 'case-label 4)
 (c-set-offset 'topmost-intro-cont 4)
 (c-set-offset 'arglist-intro 4)
 (c-set-offset 'substatement-open 0)

  ;; offset customizations not in my-c-style

  (c-set-offset 'member-init-intro '++)

  ;; other customizations

(setq tab-width 4)

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
;;(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; Python mode with vi
(defun my-python-mode-hook()
;;  (setq indent-tabs-mode nil)
  (setq py-indent-offset 4)
  (setq py-smart-indentation 4)
;;  (viper-mode)
)
(add-hook 'python-mode-hook 'my-python-mode-hook)

;; autoload my personal extensions

(setq load-path (append(list "." "~/emacs" "/usr/local/lib/emacs/ecb-2.40" ) load-path))
(autoload 'gid "idutils" nil t)
(autoload 'gtags-mode "gtags" "" t)
(setq c-mode-hook '(lambda () (gtags-mode 1) ))


(load-file "~/emacs/func-keys.el")
(server-start)



;; don't be fooled by symbolic links
(setq find-file-compare-true-names t)
;; (viper-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Buffer-menu-use-frame-buffer-list nil)
 '(column-number-mode t)
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote ("~/code/eol_spol_wt_gui/src" "~/code/eol_spol_cdp/syscon/src")))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "courier" :foundry "adobe" :slant normal :weight bold :height 105 :width normal)))))
;; this is intended for manually installed libraries
(add-to-list 'load-path "~/.emacs.d/site-lisp/")

;; this is intended for configuration snippets
(add-to-list 'load-path "~/.emacs.d/")
;; (load "config/cedet.el")

;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/ecb"))
;;(require 'ecb)


;; load the package system and add some repositories
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Install a hook running post-init.el *after* initialization took place
(add-hook 'after-init-hook (lambda () (load "post-init.el")))

;; Do here basic initialization, (require) non-ELPA packages, etc.

;; disable automatic loading of packages after init.el is done
(setq package-enable-at-startup nil)
;; and force it to happen now
(package-initialize)
;; NOW you can (require) your ELPA packages and configure them as normal

;; disable version control - don't offer to checkout files on EVERY SINGLE write!
(setq vc-handled-backends nil)
