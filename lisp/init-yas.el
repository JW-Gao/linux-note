(use-package yasnippet)
(require 'yasnippet)
(use-package yasnippet-snippets)

;;set the bundle of yas 
;;(setq yas-snippet-dirs '("/home/rat/.emacs.d/snippets/"))
;;(add-hook 'prog-mode-hook 'yas-minor-mode)
;;(add-hook 'text-mode-hook 'yas-minor-mode)
(yas-global-mode  t)
(provide 'init-yas)
