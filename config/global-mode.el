
;; Red-Portal/.emacs.d Red-Portal's personal emacs settings. 
;; Copyright (C) 2017 Red-Portal 
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

;;smex command key-bindings
;; using smex-ivy for the actual M-x stuff
(use-package smex
  :ensure t
  :config
  (smex-initialize))


;; ivy + smex
(use-package ivy-smex
  :load-path "github/ivy-smex/"
  :bind ("M-x" . ivy-smex))

;; line numbers
(use-package nlinum-hl
  :ensure t)

;; ivy settings
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1))


;; global company config
(use-package company
  :ensure t
  :config
  (global-company-mode)
  (setq company-idle-delay 0.3))


;; 80 column indicator bar
;; (use-package fill-column-indicator
;;   :ensure t
;;   :config
;;   (add-hook 'prog-mode-hook 'fci-mode))


(defun forward-lines-fast()
  "jump multiple lines forward"
  (interactive)
  (next-line 5))

(defun backward-lines-fast()
  "jump multiple lines forward"
  (interactive)
  (previous-line 5))

;; evil mode config
(use-package evil
  :ensure t
  :bind
  (:map evil-normal-state-map
	("J" . forward-lines-fast)
	("K" . backward-lines-fast))
  :config
  (evil-mode 1)
  ;; windmove evil-mode extension
  (use-package windmove
    :bind
    (:map evil-normal-state-map
	  ("C-h" . windmove-left)
	  ("C-j" . windmove-down)
	  ("C-k" . windmove-up)
	  ("C-l" . windmove-right))))


;; (load-theme 'spacemacs-dark)
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
  :init
  (add-hook 'after-change-major-mode-hook #'turn-on-solaire-mode)
  (add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer)
  :config
  (setq solaire-mode-remap-modeline nil))


;;flycheck configurations
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))


;; mode line mode configurations
(use-package airline-themes
  :ensure t
  :config
  (load-theme 'airline-doom-molokai t)
  (setq powerline-height 33)
  (setq airline-shortened-directory-length 20))


;;windMove (moving between windows using shift+arrows)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; aggressive-indent-mode
(use-package aggressive-indent
  :ensure t
  :init
  ;; (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
  ;; (add-hook 'c-mode-common-hook #'aggressive-indent-mode)
  :config
  ;; currently experimentally using global mode enabled
  (global-aggressive-indent-mode 1))

;; magit setup
(use-package magit
  :ensure t
  :bind
  ("C-x g" . magit-status))

(use-package evil-magit
  :ensure t)

;; highlight symbol
(use-package highlight-symbol
  :ensure t
  :config
  (highlight-symbol-mode)
  (setq highlight-symbol-idle-delay 0))
(global-hl-line-mode t)

;; font settings
					; Monaco
(if (string-equal system-type "gnu/linux") ; linux
    (if(member "Consolas" (font-family-list))
	(progn
	  (add-to-list 'initial-frame-alist '(font . "Consolas"))
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

(use-package ivy-smex
  :load-path "github/ivy-smex/"
  :bind ("M-x" . ivy-smex))

;; indent guide mode
(use-package highlight-indent-guides
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character)) 

;; truncate lines
(set-default 'truncate-lines t)
(add-hook 'compilation-mode-hook '(lambda ()(toggle-truncate-lines)))


;; matching parenthese highlight mode
(use-package highlight-parentheses
  :ensure t
  :config
  (add-hook 'lisp-mode-hook 'highlight-parentheses-mode))

