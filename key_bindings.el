;; magit status
(global-set-key (kbd "C-x g") 'magit-status)
(define-key evil-normal-state-map (kbd "C-c p") 'projectile-command-map)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
