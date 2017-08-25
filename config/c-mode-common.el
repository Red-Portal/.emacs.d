;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; c-mode-common.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; packages used over c, c++, obj-c, common c modes


(defvar setup-mode nil)

(if (member "-setup" 'argv)
    (progn (setq setup-mode t)
	   (message "emacs is in package setup mode."))
  nil)

(use-package cmake-mode
  :ensure t
  :mode ("CMakeLists.txt'" . cmake-mode)
  :init
  (setq cmake-tab-width 4))


;;(use-package electric-spacing
;; :init
;; (add-hook 'c-mode-common-hook #'electric-spacing-mode))

(add-hook 'c-mode-common-hook #'electric-pair-mode)

(setq c-default-style "bsd")

(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (setq tab-width 4
		   indent-tabs-mode nil
		   indent-level 4
		   c-basic-offset 4)))

(setq tab-width 4
      indent-tabs-mode nil
      indent-level 4
      c-basic-offset 4)

(use-package rtags
  :if (not (eq system-type 'ms-dos))
  :ensure t
  :bind
  ("C-;" . company-rtags)
  :config
  (if setup-mode
      (rtags-install) nil)
  (setq rtags-path "~/.emacs.d/elpa/rtags-20170714.1944/rtags-2.11/bin/")
  (add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)
  (setq rtags-autostart-diagnostics t)
  (setq rtags-completions-enabled t)
  (rtags-diagnostics))

;;
(use-package ivy-rtags
  :ensure t
  :config
  (setq rtags-display-result-backend 'ivy))


;; flycheck rtags integration
(use-package flycheck-rtags
  :if (not (eq system-type 'ms-dos))
  :ensure t
  :config
  (defun c++-mode-rtags-hook ()
    (interactive)
    (flycheck-select-checker 'rtags))
  ;;(setq-local flycheck-highlighting-mode nil)
  ;;(setq-local flycheck-check-syntax-automatically nil))
  (add-hook 'c-mode-common-hook #'c++-mode-rtags-hook))

(use-package cmake-ide
  :ensure t
  :config
  (cmake-ide-setup))

;; (use-package irony
;;   :ensure t
;;   :init
;;   (if setup-mode
;;       (irony-install-server) nil)
;;   (add-hook 'c-mode-common-hook 'irony-mode))

;; (use-package company-irony
;;   :ensure t
;;   :init
;;   (add-hook 'c-mode-common-hook
;; 	    (lambda ()
;; 	      (add-to-list 'company-backends 'company-irony))))

(use-package company-rtags
  :ensure t
  :config
  (push 'company-rtags company-backends))

;; (use-package company-irony-c-headers
;;   :ensure t
;;   :init
;;   (add-hook 'c-mode-common-hook
;; 	    (lambda()
;; 	      (add-to-list 'company-backends
;; 			   'company-irony-c-headers))))

;;(use-package function-args
;;  :init
;;  (add-hook 'c++-mode-hook 'function-args-mode)
;;  (add-hook 'c-mode-hook 'function-args-mode)
;;  :config
;;  (fa-config-default)
;;  (set-default 'semantic-case-fold t))
