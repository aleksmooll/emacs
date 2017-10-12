

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defvar current-user
  (getenv
   (if (equal system-type 'windows-nt) "USERNAME" "USER")))

(when (version< emacs-version "24.4")
  (error "Configuration require at least GNU Emacs 24.4, but you're running %s" emacs-version))

;; Always load newest byte code
(setq load-prefer-newer t)

(defvar emacs-root-dir (file-name-directory load-file-name)
  "The root dir of the Emacs distribution")
(defvar emacs-core-dir (expand-file-name "core" emacs-root-dir)
  "The home of Emacs's core functionality")
(defvar emacs-modules-dir (expand-file-name "modules" emacs-root-dir)
  "This directory all of the built-in modules")
(defvar emacs-savefile-dir (expand-file-name "savefile" emacs-root-dir)
  "This folder stores all the automatically generated save/history-files.")

(unless (file-exists-p emacs-savefile-dir)
  (make-directory emacs-savefile-dir))

;; add directories to Emacs's `load-path'
(add-to-list 'load-path emacs-core-dir)
(add-to-list 'load-path emacs-modules-dir)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

(message "Loading core...")

(require 'emacs-packages)
(require 'emacs-ui)
(require 'emacs-core)

;; OSX specific settings
(when (eq system-type 'darwin)
  (require 'prelude-osx))


