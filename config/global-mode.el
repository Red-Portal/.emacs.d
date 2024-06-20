
;; Kyurae Kim's personal emacs settings. 
;; Copyright (C) 2017-2023 Kyurae Kim
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

(setq-default indent-tabs-mode nil)

(leaf undo-tree
  :ensure t
  :require t
  :config
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history nil))

(leaf electric-pair-mod
  :config
  (electric-pair-mode t))

(leaf ivy
  :require t
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  )

(leaf counsel
  :ensure t
  :bind
  :config
  (counsel-mode 1)
  (savehist-mode 1)
  )

;; Line number
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(leaf lsp-mode
  :ensure t
  :hook
  (lsp-mode-hook . lsp))

(leaf lsp-ui
  :require lsp-mode
  :ensure t
  :hook
  (lsp-mode-hook . lsp-ui-mode))

(leaf company
  :require t
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

(leaf company-box
  :ensure t
  :hook (company-mode-hook . company-box-mode))

(defun next-line-fast()
  (interactive)
  (next-line 5))

(defun previous-line-fast()
  (interactive)
  (previous-line 5))

(leaf evil
  :require evil windmove
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (turn-on-evil-mode)
  (evil-global-set-key 'normal (kbd "J"  ) 'next-line-fast)
  (evil-global-set-key 'normal (kbd "K"  ) 'previous-line-fast)
  (evil-global-set-key 'normal (kbd "C-h") 'windmove-left)
  (evil-global-set-key 'normal (kbd "C-j") 'windmove-down)
  (evil-global-set-key 'normal (kbd "C-k") 'windmove-up)
  (evil-global-set-key 'normal (kbd "C-l") 'windmove-right)
  (evil-global-set-key 'normal (kbd "M-x") 'counsel-M-x)
  )

(leaf evil-collection
  :require evil 
  :ensure t
  :config
  (evil-collection-init)
  )

(evil-mode 1)
(turn-on-evil-mode)

(leaf doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (setq doom-one-brighter-comments t)
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config))

(leaf solaire-mode
  :ensure t
  :config
  (solaire-global-mode +1))

(leaf flycheck
  :require t
  :ensure t
  :config
  (global-flycheck-mode))

(leaf doom-modeline
  :ensure t
  :require nerd-icons
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

(leaf magit
  :require t
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
(set-default 'truncate-lines t)
(add-hook 'compilation-mode-hook '(lambda ()(toggle-truncate-lines)))

;; matching parenthese highlight mode
;; (leaf highlight-parentheses
;;   :ensure t
;;   :hook
;;   (lisp-mode-hook . highlight-parentheses-mode)
;;   (prog-mode-hook . highlight-parentheses-mode))

(leaf evil-multiedit
  :require t
  :ensure t
  :config
  (evil-multiedit-default-keybinds))

;;;;;;;;;;;;;; Cheatsheet ;;;;;;;;;;;;;;
;; ((:evil-visual-state-map
;;    ("R" . evil-multiedit-match-all)
;;    ("C-M-D" . evil-multiedit-restore)
;;    ("M-d" . evil-multiedit-and-next)
;;    ("M-D" . evil-multiedit-and-prev))
;;   (:evil-normal-state-map
;;    ("M-d" . evil-multiedit-match-and-next)
;;    ("M-D" . evil-multiedit-match-and-prev))
;;   (:evil-insert-state-map
;;    ("M-d" . evil-multiedit-toggle-marker-here))
;;   (:evil-multiedit-state-map
;;    ("RET" . evil-multiedit-toggle-or-restrict-region))
;;   (:evil-motion-state-map
;;    ("RET" . evil-multiedit-toggle-or-restrict-region))
;;   (:evil-multiedit-state-map
;;    ("C-n" . evil-multiedit-next)
;;    ("C-p" . evil-multiedit-prev))
;;   (:evil-multiedit-insert-state-map
;;    ("C-n" . evil-multiedit-next)
;;    ("C-p" . evil-multiedit-prev)))

(leaf evil
  :require evil windmove
  :ensure t
  :bind
  ((:evil-normal-state-map
    ("J" . next-line-fast)
    ("K" . previous-line-fast))
   (:evil-normal-state-map
    ("C-h" . windmove-left)
    ("C-j" . windmove-down)
    ("C-k" . windmove-up)
    ("C-l" . windmove-right)))
  :config
  (evil-mode 1)
  (turn-on-evil-mode))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(global-set-key (kbd "S-SPC") 'toggle-input-method)

(setq dired-listing-switches "-aBhl  --group-directories-first")

