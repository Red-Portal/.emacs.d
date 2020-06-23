
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

;; (quelpa '(lsp-julia :fetcher github :repo "non-Jedi/lsp-julia"))

(add-hook 'julia-mode-hook 'fci-mode)
;;(add-hook 'julia-mode-hook 'lsp-mode)
;;(add-hook 'julia-mode-hook 'company-ess-julia-objects)

(leaf julia-mode
  :ensure t)

(leaf julia-shell
  :ensure t)

(leaf flycheck-julia
  :ensure t
  :hook
  (julia-mode-hook . flycheck-julia-setup))

(leaf quelpa-use-package 
  :ensure t
  :require quelpa)

(quelpa
 '(quelpa-use-package
   :fetcher github
   :repo "non-Jedi/lsp-julia"
   :files (:defaults "languageserver")))

(leaf lsp-julia
  :require t
  :hook
  (julia-mode-hook . lsp-mode))

;; (defun julia-company-backend()
;;   (setq-local company-backends '((company-ess-julia-objects))))

