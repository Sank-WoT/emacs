(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/lism/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tron)))
 '(custom-safe-themes
   (quote
    ("0b2e94037dbb1ff45cc3cd89a07901eeed93849524b574fa8daa79901b2bfdcf" default))))
(progn ; standard keys
  (global-set-key (kbd "C-a") 'mark-whole-buffer-buffer) ; Select All. was move-beginning-of-line
  (global-set-key (kbd "C-f") 'isearch-forward) ; Find. was forward-char
  (global-set-key (kbd "C-n") 'xah-new-empty-buffer) ; New. was next-line
  (global-set-key (kbd "C-S-n") 'make-frame-command) ; New Window. was nil
  (global-set-key (kbd "C-o") 'ido-find-file)        ; Open. was open-line
  (global-set-key (kbd "C-s") 'save-buffer)  ; Save. was isearch-forward
  (global-set-key (kbd "C-S-s") 'write-file) ; Save As. was nil
  (global-set-key (kbd "C-v") 'yank)         ; Paste. was scroll-up-command
  (global-set-key (kbd "C-w") 'kill-buffer)  ; Close. was kill-region
  (global-set-key (kbd "C-y") 'redo)         ; Redo. was yank
  (global-set-key (kbd "C-z") 'undo)         ; Undo. was suspend-frame
  (global-set-key (kbd "C-i") 'previous-line): ;;up line
  (global-set-key (kbd "C-j") 'backward-char);;left 
  (global-set-key (kbd "C-l") 'forward-char);;right
  (global-set-key (kbd "C-k") 'next-line);;down line
  (global-set-key (kbd "M-l") 'forward-word): ;;up line
  (global-set-key (kbd "M-j") 'backward-word);;
  (global-set-key (kbd "M-i") 'backward-sentence);;
  (global-set-key (kbd "M-k") 'forward-sentence): ;;up
  (global-set-key (kbd "C-u") 'recenter): ;;up
  )

;; set org mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq linum-format "%d ");; set format
(global-linum-mode 1) ;; set global numer

(require 'org) ;; Вызвать org-mode
;; Inhibit startup/splash screen
(setq inhibit-splash-screen   t)
(setq ingibit-startup-message t) ;; экран приветствия можно вызвать комбинацией C-h C-a
;; óñòàíîâêà ðåæèìîâ
(setq auto-mode-alist (cons '("README" . text-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.htm$" . html-helper-mode) auto-mode-alist))
;; Coding-system settings
(set-language-environment 'UTF-8)
(if (system-is-linux) ;; для GNU/Linux кодировка utf-8, для MS Windows - windows-1251
    (progn
        (setq default-buffer-file-coding-system 'utf-8)
        (setq-default coding-system-for-read    'utf-8)
        (setq file-name-coding-system           'utf-8)
        (set-selection-coding-system            'utf-8)
        (set-keyboard-coding-system        'utf-8-unix)
        (set-terminal-coding-system             'utf-8)
        (prefer-coding-system                   'utf-8))
    (progn
        (prefer-coding-system                   'windows-1251)
        (set-terminal-coding-system             'windows-1251)
        (set-keyboard-coding-system        'windows-1251-unix)
        (set-selection-coding-system            'windows-1251)
        (setq file-name-coding-system           'windows-1251)
        (setq-default coding-system-for-read    'windows-1251)
        (setq default-buffer-file-coding-system 'windows-1251)))

(setq display-time-24hr-format t) ;; 24-часовой временной формат в mode-line
(display-time-mode             t) ;; показывать часы в mode-line
;; list package
(setq package-archives '(
                         ("elpy" . "http://jorgenschaefer.github.io/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ;; ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ))
(electric-pair-mode 1)
(require 'package)

(global-linum-mode 1) ; always show line numbers
;; Bookmark settings
(require 'bookmark)
(setq bookmark-save-flag t) ;; автоматически сохранять закладки в файл
(when (file-exists-p (concat user-emacs-directory "bookmarks"))
    (bookmark-load bookmark-default-file t)) ;; попытаться найти и открыть файл с закладками
(global-set-key (kbd "<f3>") 'bookmark-set) ;; создать закладку по F3 
(global-set-key (kbd "<f4>") 'bookmark-jump) ;; прыгнуть на закладку по F4
(global-set-key (kbd "<f5>") 'bookmark-bmenu-list) ;; открыть список закладок
(setq bookmark-default-file (concat user-emacs-directory "bookmarks")) ;; хранить закладки в файл bookmarks в .emacs.d
;; witch start 0
(require 'linum)
(setq linum-format
      (lambda (line)
        (propertize (number-to-string (1- line)) 'face 'linum)))
;;

(recentf-mode 1)
-set-key (kbd "<f7>") 'recentf-open-files)

;; tab
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; selection an line
(global-hl-line-mode 1) ;

;; open file in new window
(setq pop-up-frames t) ;

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-mode)

;;web browser
(setq browse-url-browser-function 'eww-browse-url)

(when (fboundp 'eww)
  (progn
    (defun xah-rename-eww-hook ()
      "Rename eww browser's buffer so sites open in new page."
      (rename-buffer "eww" t))
    (add-hook 'eww-mode-hook 'xah-rename-eww-hook)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



