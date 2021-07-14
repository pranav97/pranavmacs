;; mostly unused emacs keybindings.

;; default find, mx, bookmarks and buffers list be gone
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x b") #'helm-buffers-list)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)


;; window shrinking and resizing
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
(global-set-key (kbd "<f12>") 'evil-mode)

;; auto-indentation
(global-set-key "\C-m" 'newline-and-indent)

(use-package evil
  :ensure t
  :init
(setq evil-want-integration t)
(setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  ;; need that page up usig control key
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  ;; Make evil-mode up/down operate in screen lines instead of logical lines
  (define-key evil-motion-state-map "j" 'evil-next-visual-line)
  (define-key evil-motion-state-map "k" 'evil-previous-visual-line)
  ;; Also in visual mode
  (define-key evil-visual-state-map "j" 'evil-next-visual-line)
  (define-key evil-visual-state-map "k" 'evil-previous-visual-line))


(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; trying to get some normal keybindings with leader key space.
(use-package general
    :after evil
    :ensure t
    :config
    (general-evil-setup t)

    (general-define-key
        :states '(normal emacs visual)
        :keymaps 'override
        :prefix "SPC"
        "TAB"  '(evil-switch-to-windows-last-buffer
        :which-key "window-last-buff"))

    (general-define-key
        :states '(normal emacs visual)
        :keymaps 'override
        :prefix "SPC"
        "SPC"  '(helm-M-x :which-key "M-x"))


    (general-define-key
        :states 'normal
        :keymaps 'override
        :prefix "SPC"
        "'" '(shell :which-key "shell"))

    (general-define-key
        :states '(normal emacs visual)
        :keymaps 'override
        :prefix "SPC"
        "b"  '(:ignore t
            :which-key "buffers")
        "bb" '(helm-buffers-list
            :which-key "helm buffers")
        "bd" '(kill-this-buffer
            :which-key "helm delete buffer")
        "bn" '(evil-buffer-new
        :which-key "new buffer"))

    (general-define-key
        :states '(normal visual)
        :keymaps 'override
        :prefix "SPC"
        "c"  '(:ignore t
            :which-key "comment")
        "cl" '(evilnc-comment-or-uncomment-lines
            :which-key "toggle line")
        "cp" '(evilnc-comment-or-uncomment-paragraphs
            :which-key "toggle paragraph"))

    (general-define-key
        :states '(normal emacs visual)
        :keymaps 'override
        :prefix "SPC"
        "f"  '(:ignore t :which-key "general")
        ;; good enough for most cases autoterminates
        "ff" '(helm-find-files :which-key "helm-find-file")
        ;; easier to search big folders with this
        "ft" '(neotree-toggle :which-key "neotree-toggle")
        "fd" '(delete-frame :which-key "delete-frame")
        "fc" '(calendar :which-key "calendar")
        "fs" '(save-buffer :which-key "save-buffer"))

    (general-define-key
        :states '(normal emacs visual)
        :keymaps 'override
        :prefix "SPC"
        "g"  '(:ignore t :which-key "git")
        "gg" '(magit-status :which-key "status")
        "gu" '(git-gutter :which-key "git gutter")
        "gs" '(git-gutter:stage-hunk :which-key "stage-hunk")
        "gn" '(git-gutter:next-hunk :which-key "next-hunk")
        "gp" '(git-gutter:previous-hunk :which-key "previous-hunk")
        "gr" '(git-gutter:revert-hunk :which-key "revert-hunk"))

    (general-define-key
        :states '(normal)
        :keymaps 'override
        :prefix "SPC"
        "t" '(:ignore t :which-key "todos")
        "tn" '(hl-todo-previous :which-key "todo-prev")
        "tp" '(hl-todo-next :which-key "todo-next")
        "tt" '(hl-todo-insert :which-key "todo-insert")
        "to" '(hl-todo-occur :which-key "todo-occur"))

    (general-define-key
        :states 'normal
        :keymaps 'override
        :prefix "SPC"
        "h"  '(:ignore t :which-key "helm-gtags")
        "hf" '(helm-gtags-find-tag :which-key "helm-gtags-find-tag")
        "hr" '(helm-gtags-find-rtag :which-key "helm-gtags-find-rtag")
        "hk" '(helm-gtags-parse-file :which-key "helm-gtags-parse-file")
        "hp" '(helm-gtags-previous-history :which-key "helm-gtags-prev")
        "hn" '(helm-gtags-next-history :which-key "helm-gtags-next")
        "hs" '(helm-gtags-pop-stack :which-key "helm-gtags-pop"))


    (general-define-key
        :states 'normal
        :keymaps 'override
        :prefix "SPC"
        "window"  '(:ignore t :which-key "window")
        "wu" '(winner-undo :which-key "winner-undo")
        "wr" '(winner-redo :which-key "winner-redo")
        "ww" '(evil-window-next :which-key "evil-window-next")
        "ws" '(evil-window-split :which-key "evil-window-split")
        "wv" '(evil-window-vsplit :which-key "evil-window-vsplit")
        "wd" '(evil-window-delete :which-key "evil-window-delete")
        "wj" '(evil-window-down :which-key "evil-window-down")
        "wk" '(evil-window-up :which-key "evil-window-up")
        "wl" '(evil-window-right :which-key "evil-window-right")
        "wh" '(evil-window-left :which-key "evil-window-left")
        "wo" '(delete-other-windows :which-key "delete-other-windows")
        "wJ" '(evil-window-move-very-bottom
               :which-key "evil-window-move-very-bottom")
        "wK" '(evil-window-move-very-top
               :which-key "evil-window-move-very-top")
        "wL" '(evil-window-move-far-right
               :which-key "evil-window-move-far-right")
        "wH" '(evil-window-move-far-left
               :which-key "evil-window-move-far-left"))


    (general-define-key
        :states '(normal emacs visual)
        :keymaps 'override
        :prefix "SPC"
        "o"  '(:ignore t :which-key "org-stuff")
        "oa"  '(org-agenda :which-key "org-agends")
        "op"  '(org-pomodoro :which-key "org-pomodoro")
        "os"  '(org-schedule :which-eky "org-schedule"))

)

