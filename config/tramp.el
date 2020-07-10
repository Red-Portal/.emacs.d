
;; Red-Portal/.emacs.d Red-Portal's personal emacs settings. 
;; Copyright (C) 2020 Red-Portal 
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

(leaf tramp
  :require t
  :config
  (setq tramp-default-method "ssh")
  (let ((tramp-proxy-list-file (concat (file-name-as-directory "~/.emacs.d/local")
				       "tramp_proxies.el")))
    (when (file-exists-p tramp-proxy-list-file)
      (load-file tramp-proxy-list-file))))

