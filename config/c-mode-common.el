
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

(leaf cmake-mode
  :ensure t
  :mode("CMakeLists.txt'" . cmake-mode)
  :init
  (setq cmake-tab-width 4))

;;(use-package electric-spacing
;; :init
;; (add-hook 'c-mode-common-hook #'electric-spacing-mode))

;;(add-hook 'c-mode-common-hook #'electric-pair-mode)

(setq c-default-style "bsd"
      tab-width 8
      indent-tabs-mode nil
      indent-level 2
      c-basic-offset 2)

(leaf clang-format
  :ensure t
  :require t)

; ;(add-hook 'c-mode-common-hook 'c-mode-style)
(add-hook 'c-mode-common-hook 'fci-mode)

(leaf ivy-rtags
  :if (not (string-equal system-type "windows-nt"))
  :ensure t
  :config
  (setq rtags-display-result-backend 'ivy))

(leaf rtags
  :if (not (string-equal system-type "windows-nt"))
  :ensure t
  :hook
  (c-mode-common-hook . rtags-start-process-unless-running)
  ;;(setq rtags-autostart-diagnostics t)
  ;; (setq rtags-completions-enabled t)
  ;;(setq rtags-path "../elpa/rtags-20200507.1824/rtags-2.38/bin")
  (rtags-diagnostics))

;; flycheck rtags integration
;; (use-package flycheck-rtags
;;   :if (not (string-equal system-type "windows-nt"))
;;   :ensure t
;;   :config
;;   (defun c++-mode-rtags-hook ()
;;     (interactive)
;;     (flycheck-select-checker 'rtags))
;;   (add-hook 'c-mode-common-hook #'c++-mode-rtags-hook))

(leaf cmake-ide
  :ensure t
  :config
  (require 'subr-x)
  (cmake-ide-setup)
  (defadvice cmake-ide--run-cmake-impl
      (after copy-compile-commands-to-project-dir activate)
    (if (file-exists-p (concat project-dir "/compile_commands.json"))
	(progn 
	  (cmake-ide--message "[advice] found compile_commands.json" )
	  (copy-file (concat project-dir "compile_commands.json") cmake-dir)
	  (cmake-ide--message "[advice] copying compile_commands.json to %s" cmake-dir))
      (cmake-ide--message "[advice] couldn't find compile_commands.json" ))))

(leaf irony
  :ensure t
  :hook
  (c-mode-common-hook . irony-mode) 
  :init
    ;;  (irony-install-server t) nil)
  (if (string= system-type "windows-nt") 
      (when (boundp 'w32-pipe-read-delay)
	(setq w32-pipe-read-delay 0))
    (when (boundp 'w32-pipe-buffer-size)
      (setq irony-server-w32-pipe-buffer-size (* 64 1024)))))

;; (eval-after-load 'company
;;   '(add-to-list 'company-backends 'company-irony))

(defun irony-company-backend()
  (setq-local company-backends '((company-irony))))

(leaf company-irony
  :ensure t
  ;; :bind
  ;; ("C-;" . company-irony)
  :hook
  (c-mode-common-hook . irony-company-backend)
  :config
  (setq company-async-timeout 5))

;; (use-package company-rtags
;;   :if (not (string-equal system-type "windows-nt"))
;;   :ensure t
;;   :config
;;   (add-hook 'c-mode-common-hook
;; 	    (lambda ()
;; 	      (add-to-list 'company-backends 'company-rtags))))

(defun irony-headers-company-backend()
  (setq-local company-backends '((company-irony-c-headers))))

(leaf company-irony-c-headers
  :ensure t
  :hook 
  (c-mode-common-hook . irony-headers-company-backend))

;;(use-package function-args
;;  :init
;;  (add-hook 'c++-mode-hook 'function-args-mode)
;;  (add-hook 'c-mode-hook 'function-args-mode)
;;  :config
;;  (fa-config-default)
;;  (set-default 'semantic-case-fold t))
