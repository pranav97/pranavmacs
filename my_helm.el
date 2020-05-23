
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)


;; projectile locate in OS x
(setq helm-locate-command
      "glocate %s %s"
      helm-locate-create-db-command
      "gupdatedb --output='%s' --localpaths='%s'")

(setq helm-locate-project-list
      (list "/Users/pranav_raghavan/emacs_config/"))


(helm-projectile-on)

;; auto complete turns on suggestions when you are writing code
(global-auto-composition-mode)


