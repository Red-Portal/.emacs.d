;; -*- lexical-binding: t; -*-
;; Kyurae Kim's personal emacs settings. 
;; Copyright (C) 2025-2026 Kyurae Kim
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

(use-package lsp-mode
  :ensure t
  :hook
  (julia-mode . lsp-deferred)
  (python-mode . lsp-deferred)
  (lean4-mode-hook . lsp-ui-mode)
  )

(use-package lsp-ui
  :ensure t
  :hook
  (lsp-mode-hook . lsp-ui-mode))
