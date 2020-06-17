
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


;; auto-indentation
(global-set-key "\C-m" 'newline-and-indent)



;; mapping windows + numbers to the winum like command in chrome
(setq winum-keymap
    (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-`") 'winum-select-window-by-number)
    (define-key map (kbd "C-²") 'winum-select-window-by-number)
    (define-key map (kbd "M-0") 'winum-select-window-0-or-10)
    (define-key map (kbd "M-1") 'winum-select-window-1)
    (define-key map (kbd "M-2") 'winum-select-window-2)
    (define-key map (kbd "M-3") 'winum-select-window-3)
    (define-key map (kbd "M-4") 'winum-select-window-4)
    (define-key map (kbd "M-5") 'winum-select-window-5)
    (define-key map (kbd "M-6") 'winum-select-window-6)
    (define-key map (kbd "M-7") 'winum-select-window-7)
    (define-key map (kbd "M-8") 'winum-select-window-8)
    map))

(use-package evil
     :ensure t
     :config
    (evil-mode 1)
    ;; need that page up usig control key
    (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
    (define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
    ;; Make evil-mode up/down operate in screen lines instead of logical lines
    (define-key evil-motion-state-map "j" 'evil-next-visual-line)
    (define-key evil-motion-state-map "k" 'evil-previous-visual-line)
    ;; Also in visual mode
    (define-key evil-visual-state-map "j" 'evil-next-visual-line)
    (define-key evil-visual-state-map "k" 'evil-previous-visual-line)


    )



;; neo tree specific keybindings
(use-package neotree :ensure t
    :config
    (add-hook 'neotree-mode-hook
	(lambda ()


	;; my bindings
	(define-key evil-normal-state-local-map (kbd "w") 'evil-window-right)
	(define-key evil-normal-state-local-map (kbd "f") 'neotree-change-root)

	;; standard bindings
	(define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
	(define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
	(define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	(define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
	(define-key evil-normal-state-local-map (kbd "g") 'neotree-refresh)
	(define-key evil-normal-state-local-map (kbd "n") 'neotree-next-line)

	(define-key evil-normal-state-local-map
	  (kbd "p") 'neotree-previous-line)
	(define-key evil-normal-state-local-map
	  (kbd "A") 'neotree-stretch-toggle)
	(define-key evil-normal-state-local-map
	  (kbd "H") 'neotree-hidden-file-toggle))))



;; trying to get some normal keybindings with leader key space.
(use-package general :ensure t
    :config
    (general-evil-setup t)

    (general-nmap "SPC x" (general-simulate-key "C-x"))
    (general-nmap "SPC w" (general-simulate-key "C-w"))
    (general-nmap "SPC C" (general-simulate-key "C-c"))


    (general-define-key
	:states 'normal
	:keymaps 'override
	:prefix "SPC"
	"e"  '(eval-buffer :which-key "eval-buffer"))


    (general-define-key
	:states 'normal
	:keymaps 'override
	:prefix "SPC"
	"TAB"  '(evil-switch-to-windows-last-buffer
		 :which-key "window-last-buff"))

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
	:states 'normal
	:keymaps 'override
	:prefix "SPC"
	"f"  '(:ignore t :which-key "general")
	;; good enough for most cases autoterminates
	"ff" '(find-file :which-key "find-file")
	;; easier to search big folders with this 
	"fh" '(helm-find-files :which-key "helm-find-files")
	"ft" '(neotree :which-key "neotree"))

    (general-define-key
	:states 'normal
	:keymaps 'override
	:prefix "SPC"
	"g"  '(:ignore t :which-key "git")
	"gs" '(magit-status :which-key "status")
	"gp" '(magit-push :which-key "push")
	"gP" '(magit-pull :which-key "pull")
	"gl" '(magit-log-all :which-key "log")
	"gg" '(git-gutter :which-key "git gutter"))


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
	"o"  '(:ignore t :which-key "org-stuff")
	"oa"  '(org-agenda :which-key "org-agends")
	"op"  '(org-pomodoro :which-key "org-pomodoro")
        "os"  '(org-schedule :which-eky "org-schedule"))

)

