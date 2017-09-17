;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; python mode ;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar setup-mode nil)
(check-if-setup-mode)

(add-to-list 'auto-mode-alist '("\\.pyl\\'" . python-mode))

(setq python-indent-offset 4)

;; external dependencies
;;   - jedi
;;   - virtualenv
(use-package company-jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook
	    (lambda ()
	      (add-to-list 'company-backends 'company-jedi)))
  :config
  (if setup-mode
      (jedi:install-server)))
