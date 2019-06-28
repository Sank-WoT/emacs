(package-initialize)
(recentf-mode 1)
;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))
(setq inhibit-startup-message t)
(require 'package)
(package-initialize)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '(("melpa" . "http://melpa.org/packages/") ("elpa" . "http://tromey.com/elpa/") ("marmalade" . "http://marmalade-repo.org/packages/")))
;; установка мода use-mode
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))
;; init file (setting)!!!
(org-babel-load-file (expand-file-name "~/.emacs.d/settings/myinit.org"))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)
;; 
(require 'saveplace)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/.emacs.d/sample/emacskey.org")))
 '(package-selected-packages
   (quote
    (key-chord smex ox-reveal nyan-mode flycheсk zenburn-theme xref-js2 which-key web-mode use-package undo-tree try tern-auto-complete tabbar sr-speedbar sokoban smartparens rjsx-mode projectile poker org-bullets org monokai-theme mode-icons mines magit lorem-ipsum json-mode js2-refactor jedi-direx indent-guide htmlize flycheck-cask emmet-mode color-theme chess ace-window))))
(custom-set-faces
'(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
(put 'erase-buffer 'disabled nil)
