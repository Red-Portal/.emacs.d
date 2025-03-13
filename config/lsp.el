
(use-package lsp-mode
  :ensure t
  :hook
  (julia-mode . lsp))

(use-package lsp-ui
  :ensure t
  :hook
  (lsp-mode-hook . lsp-ui-mode))
