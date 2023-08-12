(defun find-file-other-window-vertically nil
  "Edit a file in another window, split vertically."
  (interactive)
  (let ((split-width-threshold 0)
        (split-height-threshold nil))
    (call-interactively 'find-file-other-window)))
(provide 'my-config)
