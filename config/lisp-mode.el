;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; lisp mode ;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package smartparens
  :ensure t
  :init
  (add-hook 'elisp-mode-hook #'smartparens-mode)
  (add-hook 'lisp-mode-hook #'smartparens-mode)
  :config
  (sp-pair "'" nil :actions :rem))

(use-package rainbow-delimiters
   :ensure t
   :init
   (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
