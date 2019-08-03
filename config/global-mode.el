
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

(setq tramp-default-method "ssh")

(leaf quelpa
  :ensure t
  :require t)

(leaf electric-pair-mod
  :config
  (electric-pair-mode t))

(leaf ivy
  :require t
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-re-builders-alist
      '((t . ivy--regex-fuzzy))))

(leaf smex
  :require t
  :ensure t)

(leaf counsel
  :require counsel smex
  :ensure t
  :bind
  ("M-x" . counsel-M-x)
  :config
  (setcdr (assoc 'counsel-M-x ivy-initial-inputs-alist) ""))

;; Line number
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(leaf company
  :require t
  :ensure t
  :config
  (global-company-mode)
  ;;(setq company-idle-delay 0.3)
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0.1))

(leaf fill-column-indicator
  :ensure t
  :hook 
  :config
  (setq fci-rule-column 80)
  (defvar-local company-fci-mode-on-p nil)
  (defun company-turn-off-fci (&rest ignore)
    (setq company-fci-mode-on-p fci-mode)
    (when fci-mode (fci-mode -1)))
  (defun company-maybe-turn-on-fci (&rest ignore)
    (when company-fci-mode-on-p (fci-mode 1)))
  (add-hook 'company-completion-started-hook #'company-turn-off-fci)
  (add-hook 'company-completion-finished-hook #'company-maybe-turn-on-fci)
  (add-hook 'company-completion-cancelled-hook #'company-maybe-turn-on-fci))

(defun next-line-fast()
  (interactive)
  (next-line 5))

(defun prvious-line-fast()
  (interactive)
  (previous-line 5))

(leaf evil
  :require evil windmove
  :ensure t
  :bind
  ((:evil-normal-state-map
    ("J" . next-line-fast)
    ("K" . prvious-line-fast))
   (:evil-normal-state-map
    ("C-h" . windmove-left)
    ("C-j" . windmove-down)
    ("C-k" . windmove-up)
    ("C-l" . windmove-right)))
  :config
  (evil-mode 1)
  (turn-on-evil-mode))

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
  :hook
  (after-change-major-mode-hook . turn-on-solaire-mode)
  (minibuffer-setup-hook . solaire-mode-in-minibuffer)
  :config
  (setq solaire-mode-remap-modeline nil))

(leaf flycheck
  :require t
  :ensure t
  :config
  (global-flycheck-mode))

(leaf doom-modeline
  :ensure t
  :require all-the-icons ;; require M-x all-the-icons-install-fonts
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

;; aggressive-indent-mode
(leaf aggressive-indent
  :ensure t
  :init
  ;; (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
  ;; (add-hook 'c-mode-common-hook #'aggressive-indent-mode)
  ;;:config
  ;; currently experimentally using global mode enabled
  ;;(global-aggressive-indent-mode 1))
  )

(leaf magit
  :require t
  :ensure t
  :bind
  ("C-x g" . magit-status))

(leaf evil-magit
  :ensure t
  :require evil-magit)

;; highlight symbol
;; (leaf highlight-symbol
;;   :ensure t
;;   :config
;;   (highlight-symbol-mode)
;;   (setq highlight-symbol-idle-delay 0))

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

(defun lsp-company-backend()
  (add-to-list 'company-backends 'company-lsp))

(leaf company-lsp
  :ensure t
  :init
  (setq lsp-auto-configure t)
  :require lsp-mode)

;; indent guide mode
;; (use-package highlight-indent-guides
;;   :ensure t
;;   :init
;;   (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
;;   :config
;;   (setq highlight-indent-guides-method 'character)) 

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
  :ensure t
  :bind
  (:evil-visual-state-map
   ("R" . evil-multiedit-match-all)
   ("C-M-D" . evil-multiedit-restore)
   ("M-d" . evil-multiedit-and-next)
   ("M-D" . evil-multiedit-and-prev))
  (:evil-normal-state-map
   ("M-d" . evil-multiedit-match-and-next)
   ("M-D" . evil-multiedit-match-and-prev))
  (:evil-insert-state-map
   ("M-d" . evil-multiedit-toggle-marker-here))
  (:evil-multiedit-state-map
   ("RET" . evil-multiedit-toggle-or-restrict-region))
  (:evil-motion-state-map
   ("RET" . evil-multiedit-toggle-or-restrict-region))
  (:evil-multiedit-state-map
   ("C-n" . evil-multiedit-next)
   ("C-p" . evil-multiedit-prev))
  (:evil-multiedit-insert-state-map
   ("C-n" . evil-multiedit-next)
   ("C-p" . evil-multiedit-prev)))

(global-set-key (kbd "S-SPC") 'toggle-input-method)
