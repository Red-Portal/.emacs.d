
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

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;; set because of signature error
(setq package-check-signature nil)

(eval-and-compile
  (customize-set-variable
   'package-archives '(("melpa stable" . "https://stable.melpa.org/packages/")
			  ("gnu"          . "https://elpa.gnu.org/packages/")
			  ("org"          . "https://orgmode.org/elpa/")
			  ("melpa"        . "https://melpa.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))
  )

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


(defun load-directory (dir)
  (let ((load-it (lambda (f) (load-file (concat (file-name-as-directory dir) f)))))
    (mapc load-it (directory-files dir nil "\\.el"))))

(load-directory "~/.emacs.d/config")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(el-get-git-shallow-clone t t)
 '(helm-minibuffer-history-key "M-p")
 '(package-archives
   '(("melpa stable" . "https://stable.melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")
     ("org" . "https://orgmode.org/elpa/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(julia-formatter nerd-icons lsp-ui company-box company all-the-icons org-ref org-ql feather company-lsp lsp-julia lsp-mode electric-pair-mod electric-pair clang-format doom-modeline telephone-line el-get hydra leaf-keywords counsel leaf stan-mode ivy-bibtex latex-preview-pane evil-multiedit htmlize ess-site julia-shell julia-mode nlinum-hl smooth-scroll highlight-parentheses highlight-indent-guides yaml-mode ein company-rtags cuda-mode highlight-symbol solaire-mode ox-gfm smartparens function-args evil-magit magit aggressive-indent markdown-mode srefactor flycheck-rtags irony-mode electric-pair-mode cmake-mode flycheck-irony flycheck spacemacs-theme cmake-ide irony doom-themes rainbow-delimiters evil ivy)))
(put 'upcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
