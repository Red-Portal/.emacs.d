
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

(use-package smartparens
  :ensure t
  :hook
  (elisp-mode-hook . smartparens-mode)
  (lisp-mode-hook . smartparens-mode)
  :config
  (sp-pair "'" nil :actions :rem))

(use-package rainbow-delimiters
   :ensure t
   :hook
   (prog-mode-hook . rainbow-delimiters-mode))
