(load "~/.emacs.d/ibuffer.el")

(require 'ido-mode
(ido-mode t)

(cua-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-hl-line-mode 1)
(global-linum-mode 1)
;;(global-undo-tree-mode)

(load-theme 'monokai t)
;;(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq-default indent-tabs-mode nul)
(setq tab-width 4)
