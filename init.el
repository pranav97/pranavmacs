(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'load-path "~/.emacs.d/external")
(package-initialize)

;; BUILT IN STUFF 
(auto-save-visited-mode)
;; folding - hide show minor mode 
(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'prog-mode-hook 'company-mode)
(setq inhibit-startup-message t) 



;; auto save folder
(setq backup-directory-alist '(("." . "~/.emacs-saves")))

;; require statements
(load-file "~/.emacs.d/requirements.el")

;; always do keybindings before helm
(load-file "~/.emacs.d/key_bindings.el")

;; helm configurations
(load-file "~/.emacs.d/my_helm.el")

(use-package nlinum-relative :ensure t
    :config
    (setq nlinum-relative-redisplay-delay 0.2)
    ;; OR "" FOR DISPLAY CURRENT LINE NUMBER
    (setq nlinum-relative-current-symbol "0")
    ;; 1 if you want 0, 2, 3...
    (setq nlinum-relative-offset 0)
    (add-hook 'prog-mode-hook 'nlinum-relative-mode))


;; which key tells you what the next key combination can be in a emacs command 
(use-package which-key :ensure t
    :config
    (which-key-mode)
    (which-key-setup-minibuffer))



;; This puts a line indicator for 80 chars
(use-package fill-column-indicator :ensure t
    :config
    (setq-default fill-column 80) 
    (setq fci-rule-width 1)
    (setq fci-rule-color "orange")
    (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
    (global-fci-mode 1))


;; turning on helm-gtags-mode
(use-package helm-gtags :ensure t
    :config
    (add-hook 'c-mode-hook 'helm-gtags-mode)
    (add-hook 'c++-mode-hook 'helm-gtags-mode)
    (add-hook 'asm-mode-hook 'helm-gtags-mode)
    (custom-set-variables
	'(helm-gtags-path-style 'relative)
	'(helm-gtags-ignore-case t)
	'(helm-gtags-auto-update t)))


(use-package winum
    :config
    (setq winum-auto-setup-mode-line nil)
    (winum-mode))


(use-package spaceline-config
    :config
    (spaceline-spacemacs-theme))


(use-package ample-theme
  :init (progn
	    (load-theme 'ample t t)
	    (load-theme 'ample-flat t t)
	    (load-theme 'ample-light t t)
	    ;; (enable-theme 'ample-light)
	    
	    (enable-theme 'ample)

	    (custom-theme-set-faces 'ample
		`(region ((t :background "#5c2556")))))
  :defer t
  :ensure t)


(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))



(use-package company :ensure t
  :config
  (setq company-idle-delay  0) 
  (setq minimum-prefix-length 1))


(use-package irony
    :config
    (add-hook 'c-mode-hook 'irony-mode)
    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))
  

  
(use-package company-irony
  :ensure t
  :config
  (add-to-list 'company-backends 'company-irony))


;;------------------------------------------------------------------------------
;;-------!! DO NOT TOUCH THIS OR YOU'LL BREAK EMACS !!!!------------------------
;;------------------------------------------------------------------------------
;;--------------------! do not touch !------------------------------------------
;;---------------------------------------------------! do not touch !-----------
;;------------------------------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote relative))
 '(package-selected-packages
   (quote
    (ample-theme company-lsp company-irony company spaceline winum rainbow-delimiters neotree fill-column-indicator helm-projectile magit which-key org-evil nlinum-relative helm evil-nerd-commenter))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
