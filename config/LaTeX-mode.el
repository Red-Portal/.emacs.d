
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
;; Red-Portal/.emacs.d Red-Portal's personal emacs settings. 
;; Copyright (C) 2017 Red-Portal 

(defun dont-truncate-lines ()
    (setq-local truncate-lines nil))

(leaf ivy-bibtex
  :ensure t
  :hook
  ;;((LaTeX-mode-hook latex-mode-hook) . set-local-bibtex-database-file)
  ((LaTeX-mode-hook latex-mode-hook) . dont-truncate-lines)
  :config
  (setq ivy-re-builders-alist
	'((ivy-bibtex . ivy--regex-ignore-order)
	  (t . ivy--regex-plus))))

(defun preview-pane-prompt ()
  (setq-local latex-preview-pane-multifile-mode 'prompt))

(leaf latex-preview-pane 
  :ensure t
  :hook
  ((LaTeX-mode-hook latex-mode-hook) . preview-pane-prompt))

