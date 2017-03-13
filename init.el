;; themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(setq-default custom-enabled-themes 'github)
(require 'init-python-django)

(require 'ido)
(ido-mode t)
(require 'init-yasnippet)
(require-package 'autopair)
(autopair-global-mode)
