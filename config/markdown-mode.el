(use-package markdown-mode
  :commands(markdown-mode gfm-mode)
  :mode(("README\\.md\\'" . gfm-mode)
	("\\.md\\'" . markdown-mode)
	("\\.markdown\\'" . markdwon-mode))
  :init(setq markdown-command "multimarkdown"))
