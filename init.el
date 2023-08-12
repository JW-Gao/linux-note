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

(use-package which-key)

;; verify system type
(require 'init-const)

(require 'init-startup)
(require 'init-ui)
(require 'init-elpa)
(require 'init-pack)

;; auto complete the parentheses
(electric-pair-mode t)
(column-number-mode t)

(require 'init-treemacs) ;;2023-07-09
(require 'init-switch-window)
(require 'init-yas)

;;(defun p-split-window-right ()
;;  (interactive)
;;  (split-window-right 80))
;;(global-set-key (kbd "C-x 3") 'p-split-window-right)

(require 'array)
(defun p-goto-line-relative (line &optional buffer)
  (declare (interactive-only forward-line))
  (interactive (goto-line-read-args t))
  (let* ((cur-line (current-line))
	 (target-line (1+ (+ cur-line line))))
    (with-suppressed-warnings ((interactive-only goto-line))
    (goto-line target-line buffer t))
    ))
(global-set-key (kbd "M-g r g") #'p-goto-line-relative)

(display-battery-mode 1)
(display-time-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)

(require 'init-cmake)
;(require 'init-org-style)
(setq explicit-shell-file-name "/usr/bin/zsh")
(setq shell-file-name "zsh")
(setq explicit-zsh-args '("--login" "--interactive"))
(defun zsh-shell-mode-setup ()
  (setq-local comint-process-echoes t))
(add-hook 'shell-mode-hook #'zsh-shell-mode-setup)
;;(run-with-timer 0 3600 'garbage-collect)

(require 'which-key)
;(setq which-key-show-early-on-C-h t)
;(setq which-key-idle-delay 10000)
;(setq which-key-idle-secondary-delay 0.05)
(setq which-key-popup-type 'side-window)
(which-key-setup-side-window-right)
(which-key-mode)

(use-package lsp-mode
  :init (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-keep-workspace-alive nil)
  :hook (;; replace xxx-mode with concrete major-mode
	 ;; (xxx-mode . lsp-deferred)
	 (c-mode . lsp-deferred)
	 (c++-mode . lsp-deferred)
	 (rust-mode . lsp-deferred)
	 (lua-mode . lsp-deferred)
	 )
  :commands (lsp lsp-deferred)
  )
;;(lsp-mode . lsp-enable-which-key-integration)
(require 'init-rust)
;;(add-to-list 'default-frame-alist '(font . "-ADBO-Source Code Pro-normal-normal-normal-*-24-*-*-*-m-0-iso10646-1"))
(add-to-list 'default-frame-alist '(font . "-PfEd-DejaVu Sans Mono-normal-normal-normal-*-24-*-*-*-m-0-iso10646-1"))
;;(add-to-list 'default-frame-alist '(font . "Cascadia Code PL-normal-normal-normal-*-24"))
(setq use-dialog-box nil)
(mouse-avoidance-mode 'banish)
(recentf-mode 1)

;;(add-hook 'emacs-startup-hook 'recentf-mode)


;;personal config
(require 'personal-setting)

