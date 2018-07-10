;; package管理
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.org/packages/")
	("org" . "http://orgmode.org/elpa/")))

;; cmdキーを superとして割り当てる
(setq mac-command-modifier 'super)

;; バックスペースの設定
(global-set-key (kbd "C-h") 'delete-backward-char)
;;(global-set-key "\C-h" 'delete-backward-char)

(global-set-key "\M-g" 'goto-line)

;; auto-complete（自動補完）
;;(require 'auto-complete-config)
;;(global-auto-complete-mode 0.5)

;; font
(add-to-list 'default-frame-alist '(font . "ricty-12"))

;; color theme
(add-to-list 'load-path "~/.emacs.d/theme/")
(load "theme-molokai.el")

;; line numberの表示
(global-linum-mode t)
(set-face-attribute 'linum nil
    :foreground "#800"
    :height 0.9)


;; tabサイズ
(setq default-tab-width 4)

;; メニューバーを非表示
(menu-bar-mode 0)

;; ツールバーを非表示
(tool-bar-mode 0)

;; default scroll bar消去
(scroll-bar-mode -1)

;; 現在ポイントがある関数名をモードラインに表示
(which-function-mode 1)

;; 対応する括弧をハイライト
(show-paren-mode 1)

;; リージョンのハイライト
(transient-mark-mode 1)

;; タイトルにフルパス表示
(setq frame-title-format "%f")

;;current directory 表示
(let ((ls (member 'mode-line-buffer-identification
		  mode-line-format)))
  (setcdr ls
	  (cons '(:eval (concat " ("
				(abbreviate-file-name default-directory)
				")"))
		            (cdr ls))))

;; スタートアップメッセージを表示させない
(setq inhibit-startup-message 1)

;; ターミナルで起動したときにメニューを表示しない
(if (eq window-system 'x)
    (menu-bar-mode 1) (menu-bar-mode 0))
(menu-bar-mode nil)

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;; スクロールは1行ごとに
(setq mouse-wheel-scroll-amount '(1 ((shift) . 5)))

;; スクロールの加速をやめる
(setq mouse-wheel-progressive-speed nil)

;; bufferの最後でカーソルを動かそうとしても音をならなくする
(defun next-line (arg)
  (interactive "p")
  (condition-case nil
	  (line-move arg)
	(end-of-buffer)))

;; エラー音をならなくする
(setq ring-bell-function 'ignore)


