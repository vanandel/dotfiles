;;; Private html configuration file
 
;; Signature file
(setq hm--html-signature-file
"http://www.atd.ucar.edu/jva/home.html")

;; don't want to use the old keymap
(setq  hm--html-use-old-keymap nil)

;; X Window System display for the html-view
(setq html-view-display ":0.0")
 
 
;; Use the expert menus?
(setq hm--html-expert t)
 
 
;; Delete the automounter path prefix /a
(setq hm--html-delete-wrong-path-prefix "/a")
 
;; Username (Only necessary if it differs from the passwd entry)
;; (setq hm--html-username "Heiko M\174nkel")
 

;; variables that need to be set to stop errors
(setq hm--html-help-foreground "red")
(setq hm--html-help-background nil)

(setq hm--html-mode-map nil)

 
;;;
; W3

 
;; Default Home Page for w3-mode in lemacs or GNU Emacs
(setq w3-default-homepage "file:/home/rsf/vanandel/doc/www/home.html")

(load-file "/local/lib/xemacs-19.14/lisp/hm--html-menus/hm--html-configuration.el")

;; boiler plate:
        (autoload 'html-mode "hm--html-menu" "HTML major mode." t)
          (or (assoc "\\.html$" auto-mode-alist)
            (setq auto-mode-alist (cons '("\\.html$" . html-mode)
                                        auto-mode-alist)))
 
        (autoload 'tmpl-expand-templates-in-buffer "tmpl-minor-mode"
          "Expand all templates in the current buffer." t)
 
        (autoload 'html-view-start-mosaic "html-view" "Start Xmosaic." t)
        (autoload 'html-view-view-buffer
          "html-view"
          "View the current buffer in Xmosaic."
          t)
        (autoload 'html-view-view-file
          "html-view"
          "View a file in Xmosaic."
          t)
        (autoload 'html-view-goto-url
          "html-view"
          "Goto url in Xmosaic."
          t)
        (autoload 'html-view-get-display
          "html-view"
          "Get the display for Xmosaic (i.e. hostxy:0.0)."
          t)

        (autoload 'w3-preview-this-buffer "w3" "WWW Previewer" t)
        (autoload 'w3 "w3" "WWW Browser" t)
        (autoload 'w3-open-local "w3" "Open local file for WWW browsing"
t)
        (autoload 'w3-fetch "w3" "Open remote file for WWW browsing" t)
        (autoload 'w3-use-hotlist "w3" "Use shortcuts to view WWW docs" t)




