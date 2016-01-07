;;
;; gud interface to tcl debugger.  Heavily based on existing gud stuff.
;; tromey Sat Aug 27 1994
;;

;; This file is part of GNU Emacs.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 1, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

(require 'gud)

;; History of argument lists passed to tcldb.
(defvar gud-tcldb-history nil)

(defun gud-tcldb-massage-args (file args)
  ;; Strip pathname from "file".  It is not a file at all, but a PID.
  ;; FIXME this is only true for tcld, but not for other debuggers.
  (cons (file-name-nondirectory file) args))

(defun gud-tcldb-find-file (f)
  (find-file-noselect f))

(defun gud-tcldb-marker-filter (string)
  (if (string-match "  file \\([^,]+\\), line \\([0-9]+\\)" string)
      (setq gud-last-frame
	    (cons (substring string (match-beginning 1) (match-end 1))
		  (string-to-int
		   (substring string (match-beginning 2) (match-end 2))))))
  string)

(defun tcldb (command-line)
  "Run tcld on program FILE in buffer *gud-FILE*.
The directory containing FILE becomes the initial working directory
and source-file directory for your debugger."
  (interactive
   (list
    (read-from-minibuffer "Run tcld (like this): "
			  (if (consp gud-tcldb-history)
			      (car gud-tcldb-history)
			    "tcld ")
			  nil nil '(gud-tcldb-history . 1))))
  (gud-overload-functions '((gud-massage-args . gud-tcldb-massage-args)
			    (gud-marker-filter . gud-tcldb-marker-filter)
			    (gud-find-file . gud-tcldb-find-file)))
  (gud-common-init command-line)

  ;; Next line won't work if filename has weird chars in it.  Should
  ;; quote them for Tcl.  But gud doesn't let us do that.
  (gud-def gud-break "b %f:%l" "\C-b" "Set breakpoint at current line.")
  (gud-def gud-finish "r" "\C-f" "Finish executing current function.")
  (gud-def gud-step "s %p" "\C-s" "Step one line with display.")
  (gud-def gud-next "n %p" "\C-n" "Step one line (skip functions).")
  (gud-def gud-cont "c" "\C-r" "Continue with display.")
  (gud-def gud-up "u %p" "<" "Up (numeric arg) stack frames.")
  (gud-def gud-down "d %p" ">" "Down (numeric arg) stack frames.")

  (setq comint-prompt-regexp "^\\(tcld[+>]\\|dbg[0-9]*\\.[0-9]*>\\) *")
  (setq paragraph-start comint-prompt-regexp)
  (run-hooks 'tcldb-mode-hook))
