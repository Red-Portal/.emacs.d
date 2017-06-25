
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(add-to-list 'package-archives '("melpa stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa china" . "http://elpa.emacs-china.org/melpa-stable/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(require 'use-package)

(load-file "~/.emacs.d/config/global-mode.el")
(load-file "~/.emacs.d/config/c-mode-common.el")
(load-file "~/.emacs.d/config/c++-mode.el")
(load-file "~/.emacs.d/config/markdown-mode.el")
(load-file "~/.emacs.d/config/python-mode.el")
(load-file "~/.emacs.d/config/lisp-mode.el")
(load-file "~/.emacs.d/config/haskell-mode.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("6bde11b304427c7821b72a06a60e8d079b8f7ae10b407d8af37ed5e5d59b1324" "9f3181dc1fabe5d58bbbda8c48ef7ece59b01bed606cfb868dd147e8b36af97c" "e91ca866d6cbb79786e314e0466f4f1b8892b72e77ed702e53bf7565e0dfd469" "227e2c160b0df776257e1411de60a9a181f890cfdf9c1f45535fc83c9b34406b" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages
   (quote
    (ox-gfm haskell-mode smartparens company-jedi function-args evil-magit magit aggressive-indent markdown-mode srefactor ivy-rtags flycheck-rtags irony-mode electric-pair-mode use-package company-irony-c-headers cmake-mode flycheck-irony flycheck spacemacs-theme rtags cmake-ide company-irony irony company doom-themes rainbow-delimiters evil smex ivy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
