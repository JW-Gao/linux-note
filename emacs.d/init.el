(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load-file custom-file))

;;set env
(setenv "PATH" (concat (getenv "PATH") ":/home/rat/.cargo/bin"))
(setq exec-path (append exec-path '("/home/rat/.cargo/bin")))

;; verify system type
(require 'init-const)

(require 'init-startup)
(require 'init-ui)
(require 'init-elpa)
(require 'init-pack)


;; lsp mode config
(use-package lsp-mode
  :init (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace xxx-mode with concrete major-mode
	 ;; (xxx-mode . lsp-deferred)
	(c-mode . lsp-deferred)
	(c++-mode . lsp-deferred)
	(rust-mode . lsp-deferred)
	(lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred)
  )

(use-package yasnippet
  :ensure
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode)
 )

;; auto complete the parentheses
(electric-pair-mode t)
