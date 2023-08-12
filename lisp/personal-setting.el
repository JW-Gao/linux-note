;; -*-coding:utf-8 -*-
;; open buffer in window horizontally/vertically
(defun person-split-window (arg)
       "split window and show buffer/file horizontally/vertically"
       (setq buffer-name-list ())
       (let ((p-b-list (buffer-list)))
	 (while p-b-list
	   (setq cb (car p-b-list))
	   (setq p-b-list (cdr p-b-list))
	   (setq buffer-name-list (cons (buffer-name cb) buffer-name-list))
	   )
	 )
       (setq buffer-name-list (reverse buffer-name-list))
       (if (= arg 1)
	   (progn
	     (split-window-horizontally)
	     (other-window 1)
	     (switch-to-buffer (completing-read "Switch to buffer : " buffer-name-list))
	     )
	 (split-window-vertically)
	 (other-window 1)
	 (switch-to-buffer (completing-read "Switch to buffer : " buffer-name-list))
	 )
       )

(defun person-split-window-horizontally ()
  "horizontally"
  (interactive)
  (person-split-window 1))
(defun person-split-window-vertically ()
  "vertically"
  (interactive)
  (person-split-window 0))

;; key-binding
(global-set-key (kbd "C-x 4 h b") #'person-split-window-horizontally)
(global-set-key (kbd "C-x 4 v b") #'person-split-window-vertically)

(provide 'personal-setting)
