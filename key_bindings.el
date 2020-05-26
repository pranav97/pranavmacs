
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x b") #'helm-buffers-list)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

(global-set-key "\C-m" 'newline-and-indent)


(use-package evil :ensure t
    :config
    (evil-mode 1)
)
  

(use-package neotree :ensure t
    :config
    (add-hook 'neotree-mode-hook
	(lambda ()
	(evil-define-key 'normal neotree-mode-map (kbd "SPC")
	    'neotree-quick-look)
	    (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
	    (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
	    (evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
	    (evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
	    (evil-define-key 'normal neotree-mode-map (kbd "p")
	    'neotree-previous-line)
	    (evil-define-key 'normal neotree-mode-map (kbd "A")
	    'neotree-stretch-toggle)
	    (evil-define-key 'normal neotree-mode-map (kbd "H")
	    'neotree-hidden-file-toggle)
	)
    )
)

(use-package general :ensure t
    :config
    (general-evil-setup t)

    (general-nmap "SPC x" (general-simulate-key "C-x"))
    (general-nmap "SPC w" (general-simulate-key "C-w"))


    (general-define-key
	:states 'normal
	:keymaps 'override
	:prefix "SPC"
	"e"  '(eval-buffer :which-key "eval-buffer"))


    (general-define-key
	:states 'normal
	:keymaps 'override
	:prefix "SPC"
	"TAB"  '(evil-switch-to-windows-last-buffer :which-key "window-last-buff"))

    (general-define-key
	:states 'normal
	:keymaps 'override
	:prefix "SPC"
	"SPC"  '(helm-M-x :which-key "M-x"))


    (general-define-key
	:states 'normal
	:keymaps 'override
	:prefix "SPC"
	"p"  '(projectile-command-map :which-key "projectile prefix"))

    (general-define-key
	:states 'normal
	:keymaps 'override
	:prefix "SPC"
	"'" '(shell :which-key "shell"))

    (general-define-key
	:states 'normal
	:keymaps 'override
	:prefix "SPC"

	"b"  '(:ignore t
		:which-key "buffers")
	"bb" '(helm-buffers-list
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
	"ft" '(neotree-toggle :which-key "neotree-toggle"))

    (general-define-key
	:states 'normal
	:keymaps 'override
	:prefix "SPC"
	"g"  '(:ignore t :which-key "git")
	"gs" '(magit-status :which-key "status")
	"gp" '(magit-push :which-key "push")
	"gP" '(magit-pull :which-key "pull")
	"gl" '(magit-log-all :which-key "log"))

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

)

