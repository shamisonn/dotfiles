(require 'package) 
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize) 

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
;; タブの無効化
(setq-default indent-tabs-mode nil)
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

;; clipboardの共有設定
(setq x-select-enable-clipboard t)

;; C-c c で compile コマンドを呼び出す
(define-key mode-specific-map "c" 'compile)
