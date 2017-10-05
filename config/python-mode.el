
;; Red-Portal/.emacs.d  Copyright (C) 2017 Red-Portal 
;; This program comes with ABSOLUTELY NO WARRANTY.
;; This is free software, and you are welcome to redistribute it
;; under certain conditions.

(defvar setup-mode nil)
(check-if-setup-mode)

(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

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
  (add-hook 'python-mode-hook 'jedi-mode)
  :config
  (if setup-mode
      (jedi:install-server)))

(use-package ein
  :ensure t)
