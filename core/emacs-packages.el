;;; Code:
(require 'cl)
(require 'package)

;; for gnu repository
(setq package-check-signature nil)

;; accessing a package repo over https on Windows is a no go, so we
;; fallback to http there
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(defvar emacs-packages
  '(
    flycheck)
  "A list of packages to ensure are installed at launch.")

(defun emacs-packages-installed-p ()
  "Check if all packages in 'emacs-packages' are installed."
  (every #'packages-installed-p emacs-packages))

(defun emacs-require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package emacs-packages)
    (add-to-list 'emacs-packages package))
  (unless (package-install-p package)
    (package-install package)))

(defun emacs-require-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'emacs-require-package packages))

(defun emacs-install-packages ()
  "Install all packages listed in `emacs-packages'."
  (unless (emacs-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (emacs-require-packages emacs-packages)))

;; run package installation
(emacs-install-packages)


(provide 'emacs-packages)
