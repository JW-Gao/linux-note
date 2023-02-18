;; unused prefix
;;C-q C-c ! @ # $ % ^ & * 


;; run-command C-c C-r as prefix
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
  :config
  (setq lsp-keep-workspace-alive nil)
  :hook (;; replace xxx-mode with concrete major-mode
	 ;; (xxx-mode . lsp-deferred)
	 (c-mode . lsp-deferred)
	 (c++-mode . lsp-deferred)
	 (rust-mode . lsp-deferred)
	 (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred)
  )

(require 'init-rust)

(require 'which-key)
;(setq which-key-show-early-on-C-h t)
;(setq which-key-idle-delay 10000)
;(setq which-key-idle-secondary-delay 0.05)
(setq which-key-popup-type 'side-window)
(which-key-setup-side-window-right)
(which-key-mode)


;;eglot config
;;(require 'eglot) ;;#debuf info
;;(add-hook 'c-mode-hook 'eglot-ensure)
;;(add-hook 'c++-mode-hook 'eglot-ensure)
;;(add-hook 'rustic-mode-hook 'eglot-ensure)
;;(remove-hook 'c-mode-hook 'eglot-ensure)
;;(remove-hook 'c++-mode-hook 'eglot-ensure)
;;(use-package yasnippet
;;  :ensure
;;  :config
;;  (yas-reload-all)
;;  (add-hook 'prog-mode-hook 'yas-minor-mode)
;;  (add-hook 'text-mode-hook 'yas-minor-mode)
;; )


;; auto complete the parentheses
(electric-pair-mode t)
(column-number-mode t)

(require 'init-treemacs)
(require 'init-switch-window)
(require 'init-yas)
;;(defun p-split-window-right ()
;;  (interactive)
;;  (split-window-right 80))
;;(global-set-key (kbd "C-x 3") 'p-split-window-right)



(defun p-goto-line-relative (line &optional buffer)
  (declare (interactive-only forward-line))
  (interactive (goto-line-read-args t))
  (let* ((cur-line (current-line))
	 (target-line (1+ (+ cur-line line))))
    (with-suppressed-warnings ((interactive-only goto-line))
    (goto-line target-line buffer t))
    ))
(global-set-key (kbd "M-g r g") 'p-goto-line-relative)

;;(run-with-timer 0 3600 'garbage-collect)
