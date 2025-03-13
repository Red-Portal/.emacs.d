
(use-package lsp-mode
  :ensure t
  :hook
  (julia-mode . lsp))

(leaf lsp-ui
  :require lsp-mode
  :ensure t
  :hook
  (lsp-mode-hook . lsp-ui-mode))
