
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

(defvar setup-mode nil)
(check-if-setup-mode)

(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

(setq python-indent-offset 4)

;; external dependencies
;;   - jedi
;;   - virtualenv
(use-package company-jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook
	    (lambda ()
	      (add-to-list 'company-backends 'company-jedi)))
  (add-hook 'python-mode-hook 'jedi-mode)
  :config
  (if setup-mode
      (jedi:install-server)))

(use-package ein
  :ensure t)
