
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(package-initialize)

(require 'evil)
(evil-mode 1)

(add-to-list 'load-path "~/.emacs.d/my_evil.el")

(require 'nlinum-relative)
(nlinum-relative-setup-evil)                    ;; setup for evil
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
(setq nlinum-relative-redisplay-delay 0)      ;; delay
(setq nlinum-relative-current-symbol "0")      ;; or "" for display current line number
(setq nlinum-relative-offset 0)                 ;; 1 if you want 0, 2, 3...
