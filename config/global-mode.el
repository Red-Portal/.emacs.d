;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; global-mode.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; packages used globally

;; load custom packages

;;smex command key-bindings
; using smex-ivy for the actual M-x stuff
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


;; rainbow delimiters
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


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


