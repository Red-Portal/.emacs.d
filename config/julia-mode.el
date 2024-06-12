
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
;; Red-Portal/.emacs.d Red-Portal's personal emacs settings. 
;; Copyright (C) 2017 Red-Portal 

(leaf julia-mode
  :ensure t)

(leaf julia-shell
  :ensure t)

;; (leaf flycheck-julia
;;   :ensure t
;;   :hook
;;   (julia-mode-hook . flycheck-julia-setup))

(leaf lsp-julia
  :require t
  :hook
  (julia-mode-hook . lsp-mode))
  
(load-file "~/.emacs.d/elpa/julia-formatter-20231130.1512/julia-formatter.el")


(require 'use-package)
(use-package julia-formatter
  :straight (julia-formatter :type git :host codeberg :repo "FelipeLema/julia-formatter.el"
                             :files ("julia-formatter.el"
                                     "toml-respects-json.el"
                                     "formatter_service.jl"
                                     "Manifest.toml" "Project.toml"))
  :hook
  (julia-mode-hook . julia-formatter-mode))

