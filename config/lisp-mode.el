(use-package smartparens
  :init
  (add-hook 'elisp-mode-hook #'smartparens-mode)
  (add-hook 'lisp-mode-hook #'smartparens-mode)
  :config
  (sp-pair "'" nil :actions :rem))
