(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
;; package dependencies
(defvar package-deps
  '(
		rainbow-delimiters
		company
		web-mode
		))
;; packageの自動インストールの設定
(defun is-installed (pkgs)
	(when (eq (not nil) (car pkgs))
	  (if (package-installed-p (car pkgs))
				(is-installed (cdr pkgs))
			(package-refresh-contents))))
(is-installed package-deps)
(dolist (pkg package-deps)
  (unless (package-installed-p pkg)
    (package-install pkg)))

;; バックアップファイルを作らない
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq delete-auto-save-files t)
(setq auto-save-default nil)
;; 日本語
(set-language-environment 'Japanese)
;; UTF-8
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
;;(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
;; Font
(set-face-attribute 'default nil
                    :family "Menlo"
                    :height 140)
;; tab幅
(setq default-tab-width 2)
;; tabをスペースにする。
(setq indent-tabs-mode nil)
;; 行番号表示
(global-linum-mode t)
;; スクロールバー,ツールバー,メニューバー非表示
(tool-bar-mode 0)
(menu-bar-mode 0)
(set-scroll-bar-mode nil)
;; タイトルバーにファイルのフルパス表示
(setq frame-title-format
      (format "%%f - Emacs"))
;; スタートアップをひょうじさせない
(setq inhibit-startup-message t)
;; 警告音を消す
(setq visible-bell t)
(setq ring-bell-function 'ignore)
;; 対応括弧をハイライト
(show-paren-mode t)
;;対応括弧を補完
(electric-pair-mode t)
;; C-hをBackspaceに
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
;; 検索(全般)時には大文字小文字の区別をしない
(setq case-fold-search t) 
;; インクリメンタルサーチ時には大文字小文字の区別をしない
(setq isearch-case-fold-search t)
;; バッファー名の問い合わせで大文字小文字の区別をしない
(setq read-buffer-completion-ignore-case t)
;; ファイル名の問い合わせで大文字小文字の区別をしない
(setq read-file-name-completion-ignore-case t)


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
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-s") 'company-filter-candidates)
(define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete)

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
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'scala-mode-hook 'rainbow-delimiters-mode)
(add-hook 'java-mode-hook 'rainbow-delimiters-mode)

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scala\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-auto-close-style 1)
(setq web-mode-tag-auto-close-style 1)
(setq web-mode-enable-auto-closing t)
; *.scala.html にて背景色を消す
(set-face-attribute 'web-mode-block-face nil :background "#000000")
(defun web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook 'web-mode-hook)

;; org-mode
(require 'org-install)
(setq org-directory "~/org/")
(setq org-agenda-files (list (expand-file-name "~/org/")))
(require 'org-capture)
(setq org-capture-templates
      '(("t" "タスク" entry (file+headline nil "TODOリスト")
         "** TODO %?\n %U\n")
        ("m" "メモ" entry (file+headline nil "メモ")
         "** %?\n %U\n")
        ("d" "日記" entry (file (expand-file-name "~/org/diaries.org"))
				 "* %?\n %U\n")))
(setq org-default-notes-file (concat org-directory "notes.org"))			
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
