;; magit status
(global-set-key (kbd "C-x g") 'magit-status)
(define-key evil-normal-state-map (kbd "C-c p") 'projectile-command-map)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

(global-set-key (kbd "C-c t") #'shell)

(global-set-key "\C-m" 'newline-and-indent)
