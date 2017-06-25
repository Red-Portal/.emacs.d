;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; c-mode-common.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; packages used over c, c++, obj-c, common c modes

(use-package cmake-mode
  :mode ("CMakeLists.txt'" . cmake-mode))

;(use-package electric-spacing
;  :init
;  (add-hook 'c-mode-common-hook #'electric-spacing-mode))

(add-hook 'c-mode-common-hook #'electric-pair-mode)


(add-hook 'c-mode-common-hook
	  '(setq-default tab-width 4
			 indent-tabs-mode nil
			 indent-level 4)
	  (setq c-default-style "bsd"
		c-basic-offset 4))

(use-package rtags
  :if (not (eq system-type 'ms-dos))
  :config
  (setq rtags-path "~/.emacs.d/elpa/rtags-20170527.450/rtags-2.10/bin/")
  (add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)
  (setq rtags-autostart-diagnostics t)
  (rtags-diagnostics))

;;
(use-package ivy-rtags
  :config
  (setq rtags-display-result-backend 'ivy))


;; flycheck rtags integration
(use-package flycheck-rtags
  :if (not (eq system-type 'ms-dos))
  :config
  (defun c++-mode-rtags-hook ()
    (interactive)
    (flycheck-select-checker 'rtags))
    ;(setq-local flycheck-highlighting-mode nil)
    ;(setq-local flycheck-check-syntax-automatically nil))
  (add-hook 'c-mode-common-hook #'c++-mode-rtags-hook))


(use-package cmake-ide)
(cmake-ide-setup)

(use-package irony-mode
  :init
  (add-hook 'c-mode-common-hook 'irony-mode)
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(use-package company-irony
  :init
  (add-hook 'c-mode-common-hook
	    (lambda ()
	      (add-to-list 'company-backends 'company-irony))))

(use-package company-irony-c-headers
  :init
  (add-hook 'c-mode-common-hook
	    (lambda()
	      (add-to-list 'company-backends
			   'company-irony-c-headers))))

(use-package function-args
  :init
  (add-hook 'c++-mode-hook 'function-args-mode)
  (add-hook 'c-mode-hook 'function-args-mode)
  :config
  (fa-config-default)
  (set-default 'semantic-case-fold t))
