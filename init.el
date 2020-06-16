(require 'package)

(setq package-archives 
  '(("gnu" . "http://elpa.gnu.org/packages/")
    ("marmalade" . "http://marmalade-repo.org/packages/")
    ("melpa" . "http://melpa.org/packages/")))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'load-path "~/.emacs.d/external")
(package-initialize)

;; BUILT IN STUFF 
;; auto save folder
(setq backup-directory-alist '(("." . "~/.emacs-saves")))
(auto-save-visited-mode)


;; folding - hide show minor mode 
(add-hook 'prog-mode-hook 'hs-minor-mode)

;; stuff like .log files or .out files treated as text mode
(setq-default major-mode 'text-mode)

;; if typing into simlpe text file or org file, then emacs inserts new lines for me
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'turn-on-auto-fill)


;; this is for wrapping
(add-hook 'prog-mode-hook (lambda () (visual-line-mode 1)))

;; emacs has built in line numbers relative
(when (version<= "26.0.50" emacs-version)
  (add-hook 'prog-mode-hook
	    (lambda ()
	      (setq display-line-numbers 'relative))))


;; remove some stuff that comes built into emacs
(setq inhibit-startup-message t) 
(toggle-scroll-bar -1) 
(tool-bar-mode -1) 
(menu-bar-mode -1)


;; always do keybindings before helm
(load-file "~/.emacs.d/key_bindings.el")

;; helm configurations
;; helm stuff
(use-package helm-config
  :config
    (helm-mode 1)
    ;; projectile locate in OS x
    (setq helm-locate-command
	"glocate %s %s"
	helm-locate-create-db-command
	"gupdatedb --output='%s' --localpaths='%s'")

    (setq helm-locate-project-list
	(list "/Users/pranav_raghavan/emacs_config/"))

    ;; required to track visited projects and put them in helm-projectile-switch
    (projectile-global-mode)
    (require 'helm-projectile)
    (setq projectile-completion-system 'helm)
    (helm-projectile-on))


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



(use-package spaceline :ensure t
  :config
  (use-package spaceline-config
    :config
    (spaceline-helm-mode 1)
    (spaceline-emacs-theme)
    (spaceline-toggle-minor-modes-off)
    (spaceline-toggle-buffer-encoding-off)
    (spaceline-toggle-buffer-encoding-abbrev-off)
    (setq powerline-default-separator 'rounded)
    (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)))


;; themes
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


(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))



;; this is the minibuffer stuff, the very last line on this buffer 
(use-package ido
    :ensure t
    :config 
    (ido-mode t)
    (setq ido-enable-flex-matching t))


(use-package git-gutter-fringe+
  :ensure t
  :config
  (global-git-gutter+-mode))
  


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
 '(helm-completion-style (quote emacs))
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote relative))
 '(org-agenda-files (quote ("~/Documents/org_files/todo-list.org")))
 '(org-pomodoro-clock-break nil)
 '(org-pomodoro-killed-sound t)
 '(org-pomodoro-short-break-sound-p nil)
 '(org-pomodoro-start-sound
   "/Users/pranavraghavan/.emacs.d/elpa/org-pomodoro-20190530.1445/resources/bell.wav")
 '(org-pomodoro-ticking-frequency 120)
 '(org-pomodoro-ticking-sound-p t)
 '(package-selected-packages
   (quote
    (yasnippet helm-gtags powershell sound-wav org-pomodoro smartparens ample-theme company-lsp company-irony company spaceline winum rainbow-delimiters neotree fill-column-indicator helm-projectile magit which-key org-evil helm evil-nerd-commenter)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "gray13" :foreground "#bdbdb3" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 125 :width normal :foundry "nil" :family "Menlo"))))
 '(cursor ((t (:background "#ffff00"))))
 '(git-gutter:modified ((t (:foreground "deep sky blue" :weight bold))))
 '(line-number-current-line ((t (:inherit line-number :stipple nil :background "#ffff00" :foreground "black"))))
 '(org-pomodoro-mode-line ((t (:background "grey100" :foreground "orange red"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "light slate blue"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "LightSkyBlue"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "light sea green"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "LightGreen"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "cyan"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "orange"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "light pink"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "grey80")))))
