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
;; óñòàíîâêà ðåæèìîâ
(setq auto-mode-alist (cons '("README" . text-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.htm$" . html-helper-mode) auto-mode-alist))
;; list package
(setq package-archives '(
                         ("elpy" . "http://jorgenschaefer.github.io/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ;; ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ))
(electric-pair-mode 1)

(global-linum-mode 1) ; always show line numbers

;; witch start 0
(require 'linum)
(setq linum-format
      (lambda (line)
        (propertize (number-to-string (1- line)) 'face 'linum)))
;;

(recentf-mode 1)
(global-set-key (kbd "<f7>") 'recentf-open-files)

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
