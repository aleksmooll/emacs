(require 'ido)
(ido-mode t)

(setq-default user-full-name   "aleksmool"
              user-mail-adress "aleksmooll@gmail.com")

;; Inhibit startup/splash screen
(setq inhibit-splash-screen     t
      inhibit-startup-message t)

;; Cursor
(setq-default cursor-type 'bar)
(set-cursor-color "#BE81F7")

;; Imenu
(require 'imenu)
(setq imenu-auto-rescan        t
      imenu-use-popup-menu   nil)
(semantic-mode 1)

;; Electric-modes settings
(electric-pair-mode     -1)
(electric-indent-mode   -1)
;; Delete selection
(delete-selection-mode t)

;; Disable GUI components
(when (display-graphic-p)
  (tool-bar-mode    -1)
  (scroll-bar-mode  -1)
  ;; Fringe settings
  (fringe-mode '(8 . 0))
  (setq-default indicate-buffer-boundaries 'left))

(tooltip-mode     -1)
(menu-bar-mode    1)
(setq use-dialog-box        nil
      redisplay-dont-pause  t
      ring-bell-function    'ignore)

;; Display the name of the current buffer in the title bar
(setq frame-title-format "Emacs editor: %b")

;; Disable backup/autosave files
(setq backup-inhibited          t
      make-backup-files         nil
      auto-save-default         nil
      auto-save-list-file-name nil)

;; Linum plugin
(require 'linum)
(line-number-mode      t)
(global-linum-mode     t)
(column-number-mode    t)
(setq linum-format " %d")

;; Indent settings
(setq-default indent-tabs-mode      nil
              tab-width             4
              tab-always-indent     nil
              c-basic-offset        2
              sh-basic-offset       2
              sh-indentation        2
              scala-basic-offset    2
              java-basic-offset     4
              standart-indent       4
              lisp-body-indent      2
              indent-line-function  'insert-tab)


;; Scrolling settings
(setq scroll-step 1
      scroll-margin 10
      scroll-conservatively 10000)

;; Short messages
(defalias 'yes-or-no-p 'y-or-n-p)

(setq next-line-add-newlines t)

;; Highlight search resaults
(setq search-highlight          t
      query-replace-highlight     t
      auto-window-vscroll         nil)

(provide 'scratch_my)
