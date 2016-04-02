(require 'package)
(require 'cl)

(defvar elpa-packages
  '(anaconda-mode
    company
    ergoemacs-mode
    python-mode
    neotree))

(defun install-packages()
  (let ((pkgs (remove-if #'package-installed-p elpa-packages)))
    (when pkgs
      (message "%s" "Emacs refresh packages database...")
      (package-refresh-contents)
      (message "%s" " done.")
      (dolist (p elpa-packages)
	(package-install p)))))

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(install-packages)
