(setq package-archives '(("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

;;(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;;			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
;;

;;(package-initialize)

;; donot check package signature
(setq package-check-signature nil)

(require 'package)

;; initialaiza package manager
(unless (bound-and-true-p package--initialized)
  (package-initialize))

;; synchro software origin
(unless package-archive-contents
  (package-refresh-contents))

;; install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-always-demand t
      use-package-expand-minimally t
      use-package-verbose t)
;; use use-package to manage
(require 'use-package)

(provide 'init-elpa)
