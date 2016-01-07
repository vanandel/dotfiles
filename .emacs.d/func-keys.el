;; LCD-ENTRY:    Pkg-Name|Author|Contact|Description|Date|Version|ftp location
;;
;; FILE:         func-keys.el
;; SUMMARY:      
;; USAGE:        XEmacs Lisp Library
;; KEYWORDS:     
;;
;; AUTHOR:       Joe VanAndel
;; ORG:          NCAR
;; E-MAIL:       vanandel@ucar.edu
;;
;; ORIG-DATE:     1-Nov-99 at 14:54:28
;; LAST-MOD:      9-Nov-99 at 08:20:58 by Joe VanAndel
;;
;; Copyright (C) 1999  NCAR
;; Licensed under the GNU General Public License, version 2.
;;

;;
;; DESCRIPTION:  
;; DESCRIP-END.

  (global-set-key  [(shift f2)] 'compile)
  (global-set-key  [f2] 'recompile)
  (global-set-key  [(shift f3)] 'cd)
  (global-set-key  [f3] 'next-error)
  (global-set-key  [f4] 'grep)
  (global-set-key  [f5] 'cvs-examine)
  (global-set-key  [f10] 'split-window-horizontally)
  (global-set-key  [(shift f10)] 'split-window-vertically)
  (global-set-key  [f9] 'split-window-vertically)
  (global-set-key  [f11] 'x-copy-primary-selection)

  (global-set-key  [(shift f11)] 'copy-primary-selection)

  (global-set-key  [f6] 'gtags-find-tag)
  (global-set-key  [(shift f6)] 'gtags-find-rtag)

  (global-set-key  [f7] 'find-tag-other-window)
  (global-set-key  [(shift f7)] 'find-tag-other-frame)

  (global-set-key  [f8] 'tags-apropos)
  (global-set-key  [f12] 'gid)


;; Menu definitions

(define-key global-map           
       [menu-bar file open-other]        
      '("Open File Other Window" . find-file-other-window))

; (easy-menu-add-item nil [menu-bar file] )

; (define-key-after
;       (lookup-key global-map [menu-bar file])
;       [forward]
;       '("Open File Other Window" . find-file-other-window)
;       'open-file)

;;; ************************************************************************
;;; Other required Elisp libraries
;;; ************************************************************************

;;; ************************************************************************
;;; Public variables
;;; ************************************************************************

;;; ************************************************************************
;;; Private variables
;;; ************************************************************************

;;; ************************************************************************
;;; Public functions
;;; ************************************************************************

;;; ************************************************************************
;;; Private functions
;;; ************************************************************************
