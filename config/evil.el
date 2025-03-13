
(defun next-line-fast()
  (interactive)
  (next-line 5))

(defun previous-line-fast()
  (interactive)
  (previous-line 5))

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  :bind
  (:map evil-normal-state-map
    ("J" . next-line-fast)
    ("K" . previous-line-fast)
    ("C-h" . windmove-left)
    ("C-j" . windmove-down)
    ("C-k" . windmove-up)
    ("C-l" . windmove-right)
    ("M-x" . counsel-M-x))
  :config
  (evil-mode 1)
  (turn-on-evil-mode))

(use-package evil-collection
  :ensure t
  :config
  (evil-collection-init)
  )

(use-package evil-multiedit
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

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))
