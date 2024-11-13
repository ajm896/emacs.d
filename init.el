;; init.el  -*- lexical-binding: t; -*-
;; Initialize package sources
(require 'package)
(setq package-archives
             '(("gnu" . "https://elpa.gnu.org/packages/") 
	       ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Ensure use-package is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(electric-pair-mode t)
(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(save-place-mode t)
(savehist-mode t)
(recentf-mode t)
(global-auto-revert-mode t)

(fido-vertical-mode 1)

(column-number-mode)
(global-display-line-numbers-mode t)

(setq mac-command-modifier 'meta)

(global-set-key [remap dabbrev-expand] 'hippie-expand)

(load (expand-file-name "~/quicklisp/slime-helper.el"))

;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "/opt/homebrew/bin/sbcl")

(load (expand-file-name "ui-config.el" user-emacs-directory))
(load (expand-file-name "packages-config.el" user-emacs-directory))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(provide 'init)
