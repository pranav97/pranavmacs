
(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))


(require 'evil-leader)
(evil-leader/set-leader "<SPC>")
(global-evil-leader-mode)
(evil-leader/set-key
  ;; useful shortcuts here
  "cl" 'evilnc-comment-or-uncomment-lines
  "ci" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  ;; not useful keybindings, keep keyboard short cuts minimal

  ;; "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  ;; "cr" 'comment-or-uncomment-region
  ;; "cv" 'evilnc-toggle-invert-comment-line-by-line
  ;; "."  'evilnc-copy-and-comment-operator
  ;; "\\" 'evilnc-comment-operator ; if you prefer backslash key
)

