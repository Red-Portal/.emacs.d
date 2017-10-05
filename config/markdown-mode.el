
;; Red-Portal/.emacs.d  Copyright (C) 2017 Red-Portal 
;; This program comes with ABSOLUTELY NO WARRANTY.
;; This is free software, and you are welcome to redistribute it
;; under certain conditions.

(use-package markdown-mode
  :ensure t
  :commands(markdown-mode gfm-mode)
  :mode(("README\\.md\\'" . gfm-mode)
	("\\.md\\'" . markdown-mode)
	("\\.markdown\\'" . markdwon-mode))
  :init(setq markdown-command "multimarkdown"))
