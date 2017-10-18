
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

;; (defvar setup-mode nil)

;; (if (member "-setup" 'argv)
;;     (progn (setq setup-mode t)
;; 	   (message "emacs is in package setup mode."))
;;   nil)

(defvar setup-mode nil)
(check-if-setup-mode)

(use-package cmake-mode
  :ensure t
  :mode ("CMakeLists.txt'" . cmake-mode)
  :init
  (setq cmake-tab-width 4))


;;(use-package electric-spacing
;; :init
;; (add-hook 'c-mode-common-hook #'electric-spacing-mode))

(add-hook 'c-mode-common-hook #'electric-pair-mode)

(setq c-default-style "bsd")

(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (setq tab-width 4
		   indent-tabs-mode nil
		   indent-level 4
		   c-basic-offset 4)))

(setq tab-width 4
      indent-tabs-mode nil
      indent-level 4
      c-basic-offset 4)

;;
(use-package ivy-rtags
  :if (not (string-equal system-type "windows-nt"))
  :ensure t
  :config
  (setq rtags-display-result-backend 'ivy))

(use-package rtags
  :if (not (string-equal system-type "windows-nt"))
  :ensure t
  :bind
  ("C-;" . company-rtags)
  :config
  (if setup-mode
      (rtags-install) nil)
  (setq rtags-path "~/.emacs.d/elpa/rtags-20170903.1710/rtags-2.14/bin/")
  (add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)
  (setq rtags-autostart-diagnostics t)
  (setq rtags-completions-enabled t)
  (rtags-diagnostics))

;; flycheck rtags integration
(use-package flycheck-rtags
  :if (not (string-equal system-type "windows-nt"))
  :ensure t
  :config
  (defun c++-mode-rtags-hook ()
    (interactive)
    (flycheck-select-checker 'rtags))
  ;;(setq-local flycheck-highlighting-mode nil)
  ;;(setq-local flycheck-check-syntax-automatically nil))
  (add-hook 'c-mode-common-hook #'c++-mode-rtags-hook))

(use-package cmake-ide
  :ensure t
  :config
  (cmake-ide-setup))

(use-package irony
  :if (string-equal system-type "windows-nt")
  :ensure t
  :init
  (if setup-mode
      (irony-install-server t) nil)
  (add-hook 'c-mode-common-hook 'irony-mode))

(use-package company-irony
  :if (string-equal system-type "windows-nt")
  :ensure t
  :init
  (add-hook 'c-mode-common-hook
	    (lambda ()
	      (add-to-list 'company-backends 'company-irony))))

(use-package company-rtags
  :if (not (string-equal system-type "windows-nt"))
  :ensure t
  :config
  (add-hook 'c-mode-common-hook
	    (lambda ()
	      (add-to-list 'company-backends 'company-rtags))))

(use-package company-irony-c-headers
  :if (string-equal system-type "windows-nt")
  :ensure t
  :init
  (add-hook 'c-mode-common-hook
	    (lambda()
	      (add-to-list 'company-backends
			   'company-irony-c-headers))))

;;(use-package function-args
;;  :init
;;  (add-hook 'c++-mode-hook 'function-args-mode)
;;  (add-hook 'c-mode-hook 'function-args-mode)
;;  :config
;;  (fa-config-default)
;;  (set-default 'semantic-case-fold t))
