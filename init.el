(require 'package)

(setq package-archives 
  '(("gnu" . "http://elpa.gnu.org/packages/")
    ("marmalade" . "http://marmalade-repo.org/packages/")
    ("melpa" . "http://melpa.org/packages/")))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'load-path "~/.emacs.d/external")
(package-initialize)

;; BUILT IN STUFF 
(auto-save-visited-mode)
;; folding - hide show minor mode 
(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'prog-mode-hook 'company-mode)
(add-hook 'prog-mode-hook (lambda () (visual-line-mode 1)))
(add-hook 'prog-mode-hook (lambda () (smart-tab-mode 1)))
(when (version<= "26.0.50" emacs-version)
  (add-hook 'prog-mode-hook
	    (lambda ()
	      (setq display-line-numbers 'relative))))


(setq inhibit-startup-message t) 
(toggle-scroll-bar -1) 
(tool-bar-mode -1) 


;; auto save folder
(setq backup-directory-alist '(("." . "~/.emacs-saves")))

;; require statements
(load-file "~/.emacs.d/requirements.el")

;; always do keybindings before helm
(load-file "~/.emacs.d/key_bindings.el")

;; helm configurations
(load-file "~/.emacs.d/my_helm.el")

(use-package org-evil :ensure t)
(use-package magit :ensure t)

;; which key tells you what the next key combination can be in a emacs command 
(use-package which-key :ensure t
    :config
    (which-key-mode)
    (which-key-setup-minibuffer))



;; This puts a line indicator for 80 chars
(use-package fill-column-indicator :ensure t
    :config
    (add-hook 'prog-mode-hook (lambda () 
	(setq-default fill-column 80) 
	(setq fci-rule-width 1)
	(setq fci-rule-color "orange")
	(fci-mode 1)
	;; (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
	;; (global-fci-mode 1)
	)))


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


(use-package auto-complete :ensure t
    :config 
    (ac-config-default)
    ;; auto complete turns on suggestions when you are writing code
    (global-auto-composition-mode))



;; Scooby-Doo by Blazej Kozlowski
;;                                             :\                  
;;                                             ;\\                 
;;                                             ; ;;  __            
;;                                             :/ :-",dP    _.ggp. 
;;                                             :     (*).-"" :$$$$;
;;                                             ;              T$$$;
;;                                            :     _,-        `TP 
;;                                            ;      `.  _      ;  
;;                                            ;        "" \    /   
;;                                            ;            `-+'    
;;                                            :            .-'     
;;                                             ;      \;   ;       
;;                                             :       `--+'-.     
;;  .---.                                       ;         ;`       
;; :_    `.                                     :         ;        
;;   "-,   ;                                   / "-.      :        
;;      ;  :                                .p""-.  ""--..:        
;;      ;  :                             .-T$$P   ""--..___l-,     
;;      ;  :                          .-"   ""            :\()l    
;;      ;  ;              _________.-"         $$          ;`-'    
;;      ;  ; bug     .--""$$$$$$$P                         :       
;;      ;  '._____.-"_.   'T$$P^'                          :       
;;      :         .-"                                 \    :       
;;        """                                :_l :_;_l             
;;                                              "
;; do not touch.
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
    (ample-theme company-lsp company-irony company spaceline winum rainbow-delimiters neotree fill-column-indicator helm-projectile magit which-key org-evil helm evil-nerd-commenter)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "gray13" :foreground "#bdbdb3" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 125 :width normal :foundry "nil" :family "Menlo"))))
 '(cursor ((t (:background "#ffff00"))))
 '(line-number-current-line ((t (:inherit line-number :stipple nil :background "#ffff00" :foreground "black")))))
