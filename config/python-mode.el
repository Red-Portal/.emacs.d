;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; python mode ;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.pyl\\'" . python-mode))

;; external dependencies
;;   - jedi
;;   - virtualenv
(use-package company-jedi
  :init
  (add-hook 'python-mode-hook
	    '(add-to-list 'company-backends 'company-jedi)
	    '(jedi:setup)))

