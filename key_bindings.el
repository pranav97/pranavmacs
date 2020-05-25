(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

(global-set-key "\C-m" 'newline-and-indent)

(evil-mode 1)

(use-package general :ensure t
  :config
  (general-evil-setup t)

  (general-nmap "SPC e" (general-simulate-key "C-x"))
  (general-nmap "SPC w" (general-simulate-key "C-w"))



  (general-define-key
    :states 'normal
    :keymaps 'override
    :prefix "SPC"
    "p"  '(projectile-command-map :which-key "projectile prefix"))

  (general-define-key
    :states 'normal
    :keymaps 'override
    :prefix "SPC"
    "'" '('shell :which-key "shell"))
  
  (general-define-key
    :states 'normal
    :keymaps 'override
    :prefix "SPC"

    "b"  '(:ignore t
	    :which-key "buffers")
    "bl" '(helm-buffers-list
	  :which-key "helm buffers")

    "bd" '(evil-delete-buffer
	  :which-key "helm delete buffer"))

  (general-define-key
    :states 'normal
    :keymaps 'override
    :prefix "SPC"
    "c"  '(:ignore t
	    :which-key "comment")
    "cl" '(evilnc-comment-or-uncomment-lines
	   :which-key "toggle line")
    "cp" '(evilnc-comment-or-uncomment-paragraphs
	   :which-key "toggle paragraph"))

  (general-define-key
    :states 'normal
    :keymaps 'override
    :prefix "SPC"
    "f"  '(:ignore t :which-key "general")
    "ff" '(helm-find-files :which-key "find-file")
    )

  
  (general-define-key
    :states 'normal
    :keymaps 'override
    :prefix "SPC"
    "g"  '(:ignore t :which-key "git")
    "gs" '(magit-status :which-key "status")
    "gp" '(magit-push :which-key "push")
    "gP" '(magit-pull :which-key "pull")

    )
)
