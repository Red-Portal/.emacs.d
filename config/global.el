
;; Kyurae Kim's personal emacs settings. 
;; Copyright (C) 2017-2025 Kyurae Kim
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

(global-font-lock-mode 1)

(setq-default indent-tabs-mode nil)

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history nil))

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  )

(use-package counsel
  :ensure t
  :bind
  :config
  (counsel-mode 1)
  (savehist-mode 1)
  )

;; Line number
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(use-package company
  :ensure t
  :bind
  ("S-RET" . company-complete)
  :init
  (setq company-backends '((company-dabbrev-code :separate company-capf company-keywords)
                         company-files
                         company-keywords
                         company-capf
                         company-yasnippet
                         company-abbrev
                         company-dabbrev))
  :config
  (global-company-mode)
  ;;(setq company-idle-delay 0.3)
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0.1))

(use-package company-box
  :ensure t
  :hook (company-mode-hook . company-box-mode))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (setq doom-one-brighter-comments t)
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config))

(use-package solaire-mode
  :ensure t
  :config
  (solaire-global-mode +1))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

(use-package doom-modeline
  :ensure t
  :init
  (setq doom-modeline-height 30)
  (setq doom-modeline-enable-word-count t)
  (setq doom-modeline-column-zero-based t)
  (setq doom-modeline t)
  :config
  (doom-modeline-mode t))

;;windMove (moving between windows using shift+arrows)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(use-package magit
  :ensure t
  :bind
  ("C-x g" . magit-status))

(global-hl-line-mode t)

;; font settings
(if (string-equal system-type "gnu/linux") 
    (if(member "Consolas" (font-family-list))
	(progn
	  (add-to-list 'initial-frame-alist '(font . "Consolas")); Monaco
	  (add-to-list 'default-frame-alist '(font . "Consolas")))
      (progn
	(add-to-list 'initial-frame-alist
		     '(font . "DejaVu Sans Mono-10"))
	(add-to-list 'default-frame-alist
		     '(font . "DejaVu Sans Mono-10")))))

;; emacs scroll setting
(setq scroll-margin 1
      scroll-conservatively 10000
      scroll-up-aggressively 0.5
      scroll-down-aggressively 0.5
      mouse-wheel-scroll-amount '(3 ((shift). 1))
      mouse-wheel-progressive-speed nil)

;; truncate lines
(set-default 'truncate-lines nil)

(global-set-key (kbd "S-SPC") 'toggle-input-method)

(setq dired-listing-switches "-aBhl  --group-directories-first")

