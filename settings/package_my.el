(require 'package)

(setq my-packages
      '(
	el-get
	flycheck
	))

(when (executable-find "python")
  (add-to-list 'my-packages 'jedi-core)
  (add-to-list 'my-packages 'company-jedi)
  (add-to-list 'my-packages 'pip-requirements)
  (add-to-list 'my-packages 'py-autopep8)
  (add-to-list 'my-packages 'py-isort)
  (when (executable-find "virtualenv")
    (add-to-list 'my-packages 'auto-virtualenv)))

;; for gnu repository
(setq package-check-signature nil)

(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (package-refresh-contents)
  (package-install 'el-get)
  (package-install 'async)
  (message "require is")
  (require 'el-get)
  (el-get 'sync))

(add-to-list 'el-get-recipe-path "~/.emacs.d/settings/recipes")
(el-get 'sync my-packages)

(provide 'package_my)
