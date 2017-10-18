
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

(global-linum-mode t)

;; ivy settings
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1))


;; global company config
(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;; eye candy themes~~
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
;;(add-hook 'c++-mode-hook
;;	  (lambda() (setq flycheck-clang-language-standard "c++14")))


;; telephone line mode configurations
(use-package telephone-line
  :ensure t
  :config
  (telephone-line-mode 1)
  (setq telephone-line-lhs
        '((evil   . (telephone-line-evil-tag-segment))
          (accent . (telephone-line-vc-segment
                     telephone-line-process-segment))
          (nil    . (telephone-line-minor-mode-segment
                     telephone-line-buffer-segment))))
  (setq telephone-line-rhs
        '((nil    . (telephone-line-misc-info-segment))
          (accent . (telephone-line-major-mode-segment))
          (evil   . (telephone-line-airline-position-segment))))
  (telephone-line-mode t))


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
(if (string-equal system-type "gnu/linux") ; linux
    (if(member "Monaco" (font-family-list))
	(progn
	  (add-to-list 'initial-frame-alist '(font . "Monaco"))
	  (add-to-list 'default-frame-alist '(font . "Monaco")))
      (progn
	(add-to-list 'initial-frame-alist
		     '(font . "DejaVu Sans Mono-10"))
	(add-to-list 'default-frame-alist
		     '(font . "DejaVu Sans Mono-10")))))

;; emacs scroll setting
(setq scroll-margin 1
      scroll-conservatively 10000
      scroll-up-aggressively 0.5
      scroll-down-aggressively 0.5)

(use-package highlight-indent-guides
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character)) 
