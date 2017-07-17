(use-package markdown-mode
  :ensure t
  :commands(markdown-mode gfm-mode)
  :mode(("README\\.md\\'" . gfm-mode)
	("\\.md\\'" . markdown-mode)
	("\\.markdown\\'" . markdwon-mode))
  :init(setq markdown-command "multimarkdown"))

(use-package ox-gfm
  :ensure t)
