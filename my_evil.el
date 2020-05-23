
(evil-mode 1)



(require 'evil-leader)
(evil-leader/set-leader "<SPC>")
(global-evil-leader-mode)


(evil-leader/set-key
    ;; useful shortcuts here
    ;; not useful keybindings, keep keyboard short cuts minimal
    "c l" 'evilnc-comment-or-uncomment-lines
    "c i" 'evilnc-quick-comment-or-uncomment-to-the-line
    "c p" 'evilnc-comment-or-uncomment-paragraphs
    "g p" 'magit-pull-from-upstream
    "g y" 'magit-push
    "g s" 'magit-status
    ;; "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
    ;; "cr" 'comment-or-uncomment-region
    ;; "cv" 'evilnc-toggle-invert-comment-line-by-line
    ;; "."  'evilnc-copy-and-comment-operator
    ;; "\\" 'evilnc-comment-operator ; if you prefer backslash key
)

