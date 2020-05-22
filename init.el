(require 'package)


(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'load-path "~/emacs_config/external")
(package-initialize)

(require 'which-key)
(require 'nlinum-relative)


(load-file "~/emacs_config/my_evil.el")

(nlinum-relative-setup-evil)                    ;; setup for evil
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
(setq nlinum-relative-redisplay-delay 0)      ;; delay
(setq nlinum-relative-current-symbol "0")      ;; or "" for display current line number
(setq nlinum-relative-offset 0)                 ;; 1 if you want 0, 2, 3...


(auto-save-visited-mode)
(which-key-mode 1)

(which-key-mode)
