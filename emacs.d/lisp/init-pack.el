;; restart-emacs package
(use-package restart-emacs)

;; set exec-path from shell using a packet
(use-package exec-path-from-shell
  :init (exec-path-from-shell-initialize)
  )

;; completion tools
(use-package company
  :config
  (setq company-dabbrev-code-everywhere t
	company-dabbrev-code-modes t
	company-dabbrev-code-others-buffers 'all
	company-dabbrev-downcase nil
	company-dabbrev-ignore-case t
	company-dabbrev-other-buffers 'all
	company-require-match nil
	company-minimum-prefix-length 2
	company-show-numbers t
	company-tooltip-limit t
	company-idle-delay 0
	company-echo-delay 0
	company-tooltip-offset-display 'scrollbar
	company-begin-commands '(self-insert-command)
	)
  (push '(company-semantic :with company-yasnippet) company-backends)
  :hook
  ((after-init . global-company-mode))
  ;;:custom
  ;;(company-idle-delay 0.2)
  ;; (company-begin-commands nil) ;; uncomment to disable popup
  )

(provide 'init-pack)
