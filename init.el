(require 'package)

(setq package-archives '(("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))


(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'load-path "~/.emacs.d/external")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)
(package-initialize)

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

;; show white spaces
(whitespace-mode 1)


;; set emacs to always use spaces
(setq-default indent-tabs-mode nil)

;; emacs tab-width
(setq-default tab-width 5)

;; git commit mode wraps at 80 chars
(add-hook 'git-commit-mode-hook (lambda() (setq fill-column 80)))


;; highlight trailing whitespaces and tabs
(add-hook 'prog-mode-hook 'whitespace-mode)

(use-package xcscope
  :ensure t
  :config
  (cscope-setup))

(load-file "~/.emacs.d/key_bindings.el")

(use-package dts-mode
  :ensure t
  :defer t)


(use-package magit
  :defer 10 
  :ensure t
  :config
  (auto-revert-mode)


  )

;; which key tells you what the next key combination can be in a emacs command
(use-package which-key
  :ensure t
  :defer 5
  :config
  (which-key-mode)
  (which-key-setup-minibuffer))

(use-package helm-config
  :defer 5
  :config
  ;; helm configurations
  (helm-mode 1))

;; turning on helm-gtags-mode
(use-package helm-gtags
  :ensure t
  :defer 10
  :config

  ;; helm gtags(add-hook 'c-mode-hook 'helm-gtags-mode)
  (add-hook 'c++-mode-hook 'helm-gtags-mode)
  (add-hook 'asm-mode-hook 'helm-gtags-mode) )


;; not lazy loaded, boo
(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1))


(use-package rainbow-delimiters
  :ensure t
  :defer t
  :init
  ;; rainbow delim
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))



(use-package git-gutter
  :ensure t
  :defer 3
  :config
  (global-git-gutter-mode +1))


(use-package winner
  :ensure t
  :defer 10
  :config
  (winner-mode))


;; neo tree specific keybindings
(use-package neotree
    :ensure t
    :defer 10)


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
 '(cursor ((t (:background "#ffff00"))))
 '(git-gutter:modified ((t (:foreground "deep sky blue" :weight bold))))
 '(line-number-current-line ((t (:inherit line-number :stipple nil :background "#ffff00" :foreground "black"))))
 '(rainbow-delimiters-base-face ((t (:inherit nil :weight bold))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#de6ad6"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "LightSkyBlue"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "light sea green"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "LightGreen"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#dffa48"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#f2dea4"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "orange"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "light pink"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "grey80"))))
 '(whitespace-indentation ((t (:foreground "#757575"))))
 '(whitespace-line ((t (:foreground "#ab75c3"))))
 '(whitespace-space ((t (:foreground "#757575"))))
 '(whitespace-space-after-tab ((t (:background "white" :foreground "#757575"))))
 '(whitespace-space-before-tab ((t (:background "white" :foreground "#757575"))))
 '(whitespace-tab ((t (:background "white"))))
 '(whitespace-trailing ((t (:background "white")))))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("ea5822c1b2fb8bb6194a7ee61af3fe2cc7e2c7bab272cbb498a0234984e1b2d9" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" default))
 '(fill-column 80)
 '(git-gutter:modified-sign "|")
 '(git-gutter:update-interval 0)
 '(helm-completion-style 'emacs)
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style 'relative)
 '(neo-window-fixed-size nil)
 '(package-selected-packages
   '(winner-mode-enable zenburn-theme dracula-theme dts-mode magit-todos yang-mode doom-modeline list-utils unicode-fonts xcscope yasnippet helm-gtags powershell sound-wav org-pomodoro smartparens ample-theme company-lsp company-irony company spaceline winum rainbow-delimiters neotree fill-column-indicator helm-projectile magit which-key org-evil helm evil-nerd-commenter))
 '(show-trailing-whitespace t)
 '(tool-bar-mode nil)
 '(which-key-dont-use-unicode t)
 '(which-key-separator "': '")
 '(whitespace-style
   '(face trailing tabs lines-tail newline empty space-after-tab::tab space-after-tab::space space-after-tab space-before-tab::tab space-before-tab::space space-before-tab))
 '(xterm-mouse-mode t))
