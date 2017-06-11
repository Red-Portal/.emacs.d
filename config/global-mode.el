;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; global-mode.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; packages used globally

;; load custom packages

(use-package ivy-smex
  :load-path "github/ivy-smex/"
  :bind ("M-x" . ivy-smex))

(global-linum-mode t)

;; ivy settings
(use-package ivy
  :config
  (ivy-mode 1))

;; ivy + smex


;; global company config
(use-package company
  :config
  (global-company-mode))

(use-package evil
  :config
  (evil-mode 1))

(load-theme 'spacemacs-dark)

;;flycheck configurations
(use-package flycheck
  :config
  (global-flycheck-mode))
;;(add-hook 'c++-mode-hook
;;	  (lambda() (setq flycheck-clang-language-standard "c++14")))


;; telephone line mode configurations
(use-package telephone-line
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


                                        ;smex command key-bindings
(use-package smex
  :config
  (smex-initialize))
                                        ;(global-set-key (kbd "M-x") 'smex)
                                        ;(global-set-key (kbd "M-X") 'smex-major-commands)
                                        ;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;;windMove (moving between windows using shift+arrows)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
