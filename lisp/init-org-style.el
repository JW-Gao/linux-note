;; successor of org-bullets is org-superstar
(use-package org-superstar
  :config
  :hook
  )

;; (use-package org-bullets
;;   :config
;;   (progn
;;     (setq org-bullets-bullet-list '("☯" "✿" "✚" "◉" "❀"))
;;     (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;;     ))

(add-hook 'org-mode-hook #'org-superstar-mode)
(setq org-catch-invisible-edits show)
(provide 'init-org-style)
