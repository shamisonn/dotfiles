;; charset UTF-8
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
;(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
;; font
(set-face-attribute 'default nil
                    :family "Noto Sans Mono CJK JP"
                    :height 142)
;; tab width
(setq default-tab-width 2)
;; tab to space
(setq indent-tabs-mode nil)
;; show row number
(global-linum-mode t)
;; set row number's line
(setq linum-format "%3d|")
;; set path str on titlebar
(setq frame-title-format
      (format "%%f - Emacs"))
;; not show bars
(tool-bar-mode 0)
(menu-bar-mode 0)
(set-scroll-bar-mode nil)
;; not show startup
(setq inhibit-startup-message t)
;; delete noise
(setq visible-bell t)
(setq ring-bell-function 'ignore)
;; highlight brackets
(show-paren-mode t)
;; auto complete brackets
(electric-pair-mode t)
;; bind backspace on C-h
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
;; ignore case
(setq case-fold-search t) 
(setq isearch-case-fold-search t)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)



(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
;; package dependencies
(defconst package-deps
  '(
    company
    rainbow-delimiters
    web-mode
    solarized-theme
    ))
;; auto install packages
(unless package-archive-contents (package-refresh-contents))
(dolist (pkg package-deps)
  (unless (package-installed-p pkg) (package-install pkg)))
;; separate custom file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))

;; company-mode
(require 'company)
(global-company-mode +1)
(setq company-idle-delay 0) 
(setq company-minimum-prefix-length 2) 
(setq company-selection-wrap-around t)
(global-set-key (kbd "C-M-i") 'company-complete)
(define-key company-active-map (kbd "C-i") 'company-complete-selection)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-s") 'company-filter-candidates)
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)

;; rainbow-delimiters
(require 'rainbow-delimiters)
(require 'cl-lib)
(require 'color)
(defun stronger-colors ()
  (interactive)
  (cl-loop
   for index from 1 to rainbow-delimiters-max-face-count
	 do
   (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
     (cl-callf color-saturate-name (face-foreground face) 30))))
(add-hook 'emacs-startup-hook 'stronger-colors)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scala\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(setq web-mode-auto-close-style 1)
(setq web-mode-tag-auto-close-style 1)
(setq web-mode-enable-auto-closing t)
; To clean background color at editing *.scala.html
(set-face-attribute 'web-mode-block-face nil :background "#000000")
(defun web-mode-hook ()
	(setq web-mode-script-padding 0)
	(setq web-mode-style-padding 0)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook 'web-mode-hook)
