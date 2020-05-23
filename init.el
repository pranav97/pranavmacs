(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'load-path "~/emacs_config/external")
(package-initialize)

(load-file "~/emacs_config/requirements.el")

(load-file "~/emacs_config/my_evil.el")

(load-file "~/emacs_config/my_helm.el")

(nlinum-relative-setup-evil)                    ;; setup for evil
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
(setq nlinum-relative-redisplay-delay 0.2)      ;; delay
(setq nlinum-relative-current-symbol "0")      ;; or "" for display current line number
(setq nlinum-relative-offset 0)                 ;; 1 if you want 0, 2, 3...


(auto-save-visited-mode)
(which-key-mode)

;; default settings for auto complete
(ac-config-default)

;; magit status
(global-set-key (kbd "C-x g") 'magit-status)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit which-key org-evil nlinum-relative helm evil-nerd-commenter auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
