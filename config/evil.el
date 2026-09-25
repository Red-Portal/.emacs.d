;; -*- lexical-binding: t; -*-
;; Kyurae Kim's personal emacs settings. 
;; Copyright (C) 2026 Kyurae Kim
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
