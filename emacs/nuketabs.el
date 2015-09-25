(defvar nuke-tabs-space-count 8 "*Each tab represent how many spaces?")
(make-variable-buffer-local 'nuke-tabs-space-count)

(defun nuke-tabs ()
  "Expand all tabs to nuke-tabs-space-count spaces right before write it
to the file"
  (interactive)
  (let ( (replacement (make-string nuke-tabs-space-count 32)) )
    (save-excursion
      (goto-char (point-min))
      (while (search-forward "\t" nil t)
        (replace-match replacement nil t)) )) )

(add-hook 'write-file-hooks 'nuke-tabs)
