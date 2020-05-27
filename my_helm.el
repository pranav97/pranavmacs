
(use-package helm-config
  :config
    (helm-mode 1)
    ;; projectile locate in OS x
    (setq helm-locate-command
	"glocate %s %s"
	helm-locate-create-db-command
	"gupdatedb --output='%s' --localpaths='%s'")

    (setq helm-locate-project-list
	(list "/Users/pranav_raghavan/emacs_config/"))

    ;; required to track visited projects and put them in helm-projectile-switch
    (projectile-global-mode)
    (setq projectile-completion-system 'helm)
    (helm-projectile-on))
