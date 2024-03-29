(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(package-initialize)

(exec-path-from-shell-initialize)


(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'load-path "~/.emacs.d/external")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

;; BUILT IN STUFF
;; consider underscore as one word
(add-hook 'c-mode-common-hook
          (lambda () (modify-syntax-entry ?_ "w")))

;; this is for xterm to see mouse
(xterm-mouse-mode 1)
;; removes 'newer byte compiled error'
(setq load-prefer-newer t)

;; auto save folder
(setq backup-directory-alist '(("." . "~/.emacs-saves")))
(auto-save-visited-mode)


;; folding - hide show minor mode
(add-hook 'prog-mode-hook 'hs-minor-mode)

;; highlight todo tierms
(global-hl-todo-mode)
(setq hl-todo-keyword-faces
      '(("TODO"   . "#FF0000")
        ("FIXME"  . "#FF0000")
        ("DEBUG"  . "#A020F0")
        ("GOTCHA" . "#FF4500")
        ("STUB"   . "#1E90FF")))

;; stuff like .log files or .out files treated as text mode
(setq-default major-mode 'text-mode)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'turn-on-auto-fill)


;; this is for wrapping
(add-hook 'prog-mode-hook (lambda () (visual-line-mode 1)))


;; emacs has built in line numbers relative
(when (version<= "26.0.50" emacs-version)
 (add-hook 'prog-mode-hook
           (lambda ()
             (setq display-line-numbers 't))))


;; remove some stuff that comes built into emacs
(setq inhibit-startup-message t)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode ) (menu-bar-mode  -1))

;; c mode config
(setq c-basic-offset 4)

;; set emacs to always use spaces
(setq-default indent-tabs-mode nil)

;; emacs tab-width
(setq-default tab-width 5)

;; git commit mode wraps at 80 chars
(add-hook 'git-commit-mode-hook (lambda() (setq fill-column 80)))
    

;; (use-package xcscope
;;   :ensure t
;;   :config
;;   :commands cscope-setup
;;   (message "DEBUG: xcscope loaded")
;;   (cscope-setup))

(load-file "~/.emacs.d/key_bindings.el")

;; (use-package dts-mode
;;   :ensure t
;;   :config
;;   (message "DEBUG: dts-mode loaded"))


(use-package magit
  ;; :defer 10
  :ensure t
  :commands magit-status
  :config
  (message "DEBUG: magit mode loaded")
  (auto-revert-mode))

;; which key tells you what the next key combination can be in a emacs command
(use-package which-key
  :ensure t
  :defer 10
  :config
  (message "DEBUG: which key mode loaded")
  (which-key-mode)
  (which-key-setup-minibuffer))

(use-package helm-config
  :commands helm-find-files helm-Mx
  :config
  (message "DEBUG: helm config loaded")
  ;; helm configurations
  (helm-mode 1))

;; turning on helm-gtags-mode
(use-package helm-gtags
  :ensure t
  :commands helm-gtags-dwim helm-gtags-create-tags helm-gtags-select helm-gtags-pop-stack helm-gtags-previous-history helm-gtags-find-tag
  :config

  (message "DEBUG: helm-gtags loaded")

  (setq
      helm-gtags-ignore-case t
      helm-gtags-auto-update t
      helm-gtags-use-input-at-cursor t
      helm-gtags-pulse-at-cursor t)

  (add-hook 'dired-mode-hook 'helm-gtags-mode)
  (add-hook 'eshell-mode-hook 'helm-gtags-mode)
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  (add-hook 'c++-mode-hook 'helm-gtags-mode)
  (add-hook 'asm-mode-hook 'helm-gtags-mode))


;; not lazy loaded, boo
(use-package doom-modeline
  :ensure t
  :defer 10
  :config
  (doom-modeline-mode 1)
  (message "DEBUG: doom-modeline loaded")

  )


(use-package rainbow-delimiters
  :ensure t
  :defer 10
  :config
  (message "DEBUG: rainbow-delimiters loaded")
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))



(use-package git-gutter
  :ensure t
  :config
  (message "DEBUG: git-gutter loaded")
  (global-git-gutter-mode +1))


(use-package winner
  :ensure t
  :defer 10
  :config
  (message "DEBUG: winner loaded")
  (winner-mode))


;; neo tree specific keybindings
(use-package neotree
    :ensure t
    :commands neotree-toggle
    :config 
    (message "DEBUG: neotree loaded"))

;; (use-package irony
;;   :ensure t
;;   :config
;;   (irony-mode)
;;   (add-hook 'c++-mode-hook 'irony-mode))

;; (use-package company-irony
;;   :ensure t
;;   :config
;;   (add-to-list 'company-backends 'company-irony))


(use-package ggtags
  :ensure t
  :commands ggtags-find-file ggtags-create-tags ggtags-update-tags ggtags-pop-tag-mark ggtags-find-other-symbol ggtags-tag-history ggtags-find-reference
  :config
  (message "DEBUG: ggtags loaded")
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1)))))




(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(setq exec-path (append exec-path '("/homes/raghavanp/mystuff/bin")))

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

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(git-gutter:modified ((t (:foreground "deep sky blue" :weight bold))))
 '(rainbow-delimiters-base-face ((t (:inherit nil :weight bold))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#de6ad6"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "LightSkyBlue"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "light sea green"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "LightGreen"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#dffa48"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#f2dea4"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "orange"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "light pink"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "grey80")))))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-enabled-themes '(doom-gruvbox))
 '(custom-safe-themes
   '("7eea50883f10e5c6ad6f81e153c640b3a288cd8dc1d26e4696f7d40f754cc703" "ea5822c1b2fb8bb6194a7ee61af3fe2cc7e2c7bab272cbb498a0234984e1b2d9" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" default))
 '(fill-column 80)
 '(git-gutter:update-interval 0)
 '(helm-completion-style 'emacs)
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style 'relative)
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2aa198")
     ("PROG" . "#268bd2")
     ("OKAY" . "#268bd2")
     ("DONT" . "#d70000")
     ("FAIL" . "#d70000")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#875f00")
     ("KLUDGE" . "#875f00")
     ("HACK" . "#875f00")
     ("TEMP" . "#875f00")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(neo-window-fixed-size nil)
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(package-selected-packages
   '(doom-themes spacemacs-theme helm-themes exec-path-from-shell ggtags logview irony winner-mode-enable zenburn-theme dracula-theme dts-mode magit-todos yang-mode doom-modeline list-utils unicode-fonts xcscope yasnippet helm-gtags powershell sound-wav org-pomodoro smartparens ample-theme company-lsp company-irony company spaceline winum rainbow-delimiters neotree fill-column-indicator helm-projectile magit which-key org-evil helm evil-nerd-commenter))
 '(tool-bar-mode nil)
 '(which-key-dont-use-unicode t)
 '(which-key-separator "': '")
 '(whitespace-style
   '(face trailing tabs lines-tail newline empty space-after-tab::tab space-after-tab::space space-after-tab space-before-tab::tab space-before-tab::space space-before-tab))
 '(xterm-mouse-mode t))
