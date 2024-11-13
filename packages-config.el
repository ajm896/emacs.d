(use-package doom-modeline
	     :ensure t
	     :init (doom-modeline-mode 1))

(use-package rainbow-delimiters
	     :ensure
	     :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
	     :ensure
	     :init (which-key-mode)
	     :diminish which-key-mode
	     :config (setq which-key-idle-delay 0.3))


(use-package surround
  :ensure t
  :bind-keymap ("M-'" . surround-keymap))

(use-package elpy
  :ensure
  :init
  (elpy-enable))

(use-package paredit
  :ensure t
  :hook ((emacs-lisp-mode . enable-paredit-mode)
         (eval-expression-minibuffer-setup . enable-paredit-mode)
         (lisp-mode . enable-paredit-mode) 
         (lisp-interaction-mode . enable-paredit-mode)
         (slime-repl-mode . enable-paredit-mode))
  :config
  (show-paren-mode t)
    
  :bind (("C->" . paredit-forward-slurp-sexp)
         ("C-<" . paredit-forward-barf-sexp)
         ("C-M-<" . paredit-backward-slurp-sexp)
         ("C-M->" . paredit-backward-barf-sexp)
         ("<C-right>" .  nil)
         ("<C-left>" .  nil)
         ("M-[" . paredit-wrap-square)
         ("M-{" . paredit-wrap-curly))
    
  ;; :after (autoload 'enable-paredit-mode "paredit" "Turn on
  ;; pseudo-structural editing of Lisp code." t)
  )

(use-package go-mode
  :ensure)

(use-package vterm :ensure)

(use-package eglot
  :ensure t
  :hook (go-mode . eglot-ensure) (eglot-managed-mode . company-mode)
  :config (add-to-list 'eglot-server-programs '(go-mode . ("gopls"))))

(use-package exec-path-from-shell
  :ensure t
  :config (when (memq window-system '(mac ns x))
            (exec-path-from-shell-initialize)))

(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :config (setq company-idle-delay 0.3) (setq company-minimum-prefix-length 1)
  :bind (:map company-active-map ("<tab>" . company-complete-selection))
  :init (setq company-backends '((company-capf company-files))))
