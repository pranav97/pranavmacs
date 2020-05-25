(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'load-path "~/.emacs.d/external")
(package-initialize)

;; auto save folder
(setq backup-directory-alist '(("." . "~/.emacs-saves")))

;; require statements
(load-file "~/.emacs.d/requirements.el")

;; evil mode configurations
(load-file "~/.emacs.d/my_evil.el")

;; always do keybindings before helm
(load-file "~/.emacs.d/key_bindings.el")

;; helm configurations
(load-file "~/.emacs.d/my_helm.el")

;; SETUP FOR EVIL
(nlinum-relative-setup-evil)
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
;; DELAY
(setq nlinum-relative-redisplay-delay 0.2)

;; OR "" FOR DISPLAY CURRENT LINE NUMBER
(setq nlinum-relative-current-symbol "0")

;; 1 if you want 0, 2, 3...
(setq nlinum-relative-offset 0)

(auto-save-visited-mode)

;; which key tells you what the next key combination can be in a emacs command 
(which-key-mode)
(which-key-setup-minibuffer)

;; default settings for auto complete
(ac-config-default)


;; auto complete turns on suggestions when you are writing code
(global-auto-composition-mode)


;; This puts a line indicator for 80 chars
(setq-default fill-column 80) 
(setq fci-rule-width 1)
(setq fci-rule-color "red")
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

;; folding using hide show minor mode in emacs buit in
(add-hook 'prog-mode-hook 'hs-minor-mode)




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
 '(package-selected-packages
   (quote
    (fill-column-indicator
     helm-projectile
     magit
     which-key
     org-evil
     nlinum-relative
     helm
     evil-nerd-commenter
     auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
