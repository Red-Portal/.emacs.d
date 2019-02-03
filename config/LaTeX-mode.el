
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

;;(add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))

(use-package ivy-bibtex
  :ensure t
  :config
  (setq ivy-re-builders-alist
	'((ivy-bibtex . ivy--regex-ignore-order)
	  (t . ivy--regex-plus))))

(use-package latex-preview-pane 
  :ensure t)

(add-hook 'LaTeX-mode-hook (lambda ()(setq-local truncate-lines nil)))
(add-hook 'latex-mode-hook (lambda ()(setq-local truncate-lines nil)))

(add-hook 'latex-mode-hook
	  (lambda ()(setq-local bibtex-completion-bibliography '("./references.bib"))))
(add-hook 'Latex-mode-hook
	  (lambda ()(setq-local bibtex-completion-bibliography '("./references.bib"))))

(add-hook 'latex-mode-hook
	  (lambda ()(setq-local latex-preview-pane-multifile-mode 'prompt)))
(add-hook 'Latex-mode-hook
	  (lambda ()(setq-local latex-preview-pane-multifile-mode 'prompt)))

