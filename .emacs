;;;
;;;基本の概観
;;;

(set-background-color "gray82")

;;;
;;;MULE-UCSの設定
;;;
(require 'un-define) ; Unicode
(require 'jisx0213)  ; JIS X 0213

;;;
;;;日本語環境の基本設定
;;;
(set-language-environment "Japanese")
(mw32-ime-initialize)
(setq default-input-method "MW32-IME")

;;;
;;;フォント設定モジュールの読み込み
;;;
;;;
;以下の3行のそれぞれ行末でC-x C-eを実行したときに得られるリストを
;を元にして、フォントを設定する。
;(setq eval-expression-print-level nil)
;(setq eval-expression-print-length nil)
;(w32-query-get-logfont)
;;;
(when (require 'font-setup nil t)
  (setq font-setup-bdf-dir "C:/Meadow/packages/fonts/intlfonts-1.2.1")
  (font-setup "東風ゴシック" 1)
  (font-setup "ＭＳ ゴシック" 49 t)
  (font-setup "東風明朝" 1 t)
  (font-setup "ＭＳ 明朝" 17 t))

;;;
;;; 12dot font
;;;

(w32-add-font
 "BDF M+ 12"
 '((strict-spec
    ((:char-spec ascii :height any)
     (bdf-font "c:/Meadow/packages/fonts/mplus/mplus_f12r.bdf")
          ((spacing . 0)))
    ((:char-spec ascii :height any :weight bold)
     (bdf-font "c:/Meadow/packages/fonts/mplus/mplus_f12b.bdf")
          ((spacing . 0)))
    ((:char-spec ascii :height any :slant italic)
     (bdf-font "c:/Meadow/packages/fonts/mplus/mplus_f12r.bdf")
          ((spacing . 0)))
    ((:char-spec ascii :height any :weight  bold :slant italic)
     (bdf-font "c:/Meadow/packages/fonts/mplus/mplus_f12b.bdf")
          ((spacing . 0)))
    ((:char-spec japanese-jisx0208 :height any)
     (bdf-font "c:/Meadow/packages/fonts/mplus/mplus_j12r.bdf")
          ((spacing . 0)))
    ((:char-spec japanese-jisx0208 :height any :weight bold :slant any)
     (bdf-font "c:/Meadow/packages/fonts/mplus/mplus_j12b.bdf")
     ((spacing . 0))))))

;;;
;;; 14dot font
;;;

(w32-add-font
 "shnm14"
 '((strict-spec
    ((:char-spec ascii :height any)
     (bdf-font "c:/Meadow/packages/fonts/shnm/shnm7x14r.bdf")
     ((spacing . 0)))
    ((:char-spec ascii :height any :weight bold)
     (bdf-font "c:/Meadow/packages/fonts/shnm/shnm7x14rb.bdf")
     ((spacing . 0)))     
    ((:char-spec ascii :height any :slant italic)
     (bdf-font "c:/Meadow/packages/fonts/shnm/shnm7x14ri.bdf")
     ((spacing . 0)))     
    ((:char-spec ascii :height any :weight  bold :slant italic)
     (bdf-font "c:/Meadow/packages/fonts/shnm/shnm7x14rbi.bdf")
     ((spacing . 0)))     
    ((:char-spec japanese-jisx0208 :height any)
     (bdf-font "c:/Meadow/packages/fonts/shnm/shnmk14.bdf")
     ((spacing . 0)))     
    ((:char-spec japanese-jisx0208 :height any :weight bold :slant any)
     (bdf-font "c:/Meadow/packages/fonts/shnm/shnmk14b.bdf")
     ((spacing . 0))))))

;;;
;;; 行間調整
;;;
(setq-default line-spacing 1)

;;;
;;;メニューの日本語化
;;;
(require 'menu-tree)

;;;
;;;ツールバー非表示
;;;
(tool-bar-mode nil)

;;;
;;;Windows IME の ON/OFF 状態をモードラインに表示する
;;;
(setq mw32-ime-show-mode-line t) ; デフォルトで t（表示する）。
;;;
;;;モードラインに表示される IME のインジケータをカスタマイズする
;;; OFF : [--]
;;;; ON  : [あ]
(setq-default mw32-ime-mode-line-state-indicator "[--]")
(setq mw32-ime-mode-line-state-indicator "[--]")
(setq mw32-ime-mode-line-state-indicator-list
      '("[--]" "[あ]" "[--]"))

;;;
;;; font-lock設定
;;;
(global-font-lock-mode t)

;;;
;;;左右のスペースにアイコン出さない
;;;
;;;(set-face-foreground 'fringe (face-background 'fringe))

;;;
;;;カーソルの点滅停止
;;;
(blink-cursor-mode 0)

;;;
;;; タブ幅の指定(4文字分)
;;;
(setq tab-width 4)

;;;80文字で自動改行
;;;(setq fill-column 80)
;;;(setq text-mode-hook 'turn-on-auto-fill)
;;;(setq default-major-mode 'text-mode)

;;; バックアップファイル作らない
(setq make-backup-files nil)

;;; 現在の関数名表示モード
(which-function-mode 1)

;;; オートスクロールは1行づつ
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)

;;; カーソル位置の調整
(global-set-key "\C-l" 'exp-recenter)
(defun exp-recenter () "Re-Center"
  (interactive)
  (let (ypos, center)
	(setq ypos (count-lines (window-start) (point)))
	(setq center (/ (window-height) 2))
	(if (string= last-command "exp-recenter")
	  (if (and (>= ypos (- center 1)) (<= ypos (+ center 1)))
		  (recenter 0)
		(if (> ypos center)
			(recenter 0)
		  (recenter nil)))
	  (recenter nil))))

(global-set-key "\C-v" 'exp-pagedown)
(global-set-key [next] 'exp-pagedown)
(defun exp-pagedown () "Page Down"
  (interactive)
  (if (> (count-lines (window-end) (point)) 2)
	  (forward-line (- (count-lines (point) (window-end)) 2))
	(progn
	  (forward-line (/ (window-height) 2)) ; 半画面
;	  (forward-line (- (window-height) 4)) ; 全画面
	  (recenter -1))))

(global-set-key "\M-v" 'exp-pageup)
(global-set-key [prior] 'exp-pageup)
(defun exp-pageup () "Page Up"
  (interactive)
  (if (/= (window-start) (point))
	  (goto-char (window-start))
	(progn
	  (forward-line (- 0 (/ (window-height) 2))) ; 半画面
;	  (forward-line (- 3 (window-height))) ; 前画面
	  (recenter 0))))

;;
;;分割画面を入れ替える swap screen
;;
(defun swap-screen()                                  
  "Swap two screen,leaving cursor at current window." 
  (interactive)                                       
  (let ((thiswin (selected-window))                   
	(nextbuf (window-buffer (next-window))))      
    (set-window-buffer (next-window) (window-buffer)) 
    (set-window-buffer thiswin nextbuf)))             
(defun swap-screen-with-cursor()                      
  "Swap two screen,with cursor in same buffer."       
  (interactive)                                       
  (let ((thiswin (selected-window))                   
	(thisbuf (window-buffer)))                    
    (other-window 1)                                  
    (set-window-buffer thiswin (window-buffer))       
    (set-window-buffer (selected-window) thisbuf)))   
(global-set-key [f2] 'swap-screen)                    
(global-set-key [S-f2] 'swap-screen-with-cursor)      


;;; スペースでなくtab(4文字分)でインデント
(add-hook 'java-mode-hook 'my-java-mode-hook)

     (defun my-java-mode-hook ()
       (setq tab-width 4)
       (cond (window-system
              (turn-on-font-lock))))
     (setq tab-width 4)
     (setq font-lock-maximum-decoration t)

(add-hook 'c-mode-hook 
	'(lambda () (font-lock-mode 1)
		    (c-set-style "bsd")
                    (setq fill-column 71)
		    (setq c-basic-offset 4)
		    (setq tab-width 4)
                    'turn-on-auto-fill))
(add-hook 'c++-mode-hook 
	'(lambda () (font-lock-mode 1)
		    (c-set-style "bsd")	   
                    (setq fill-column 71)
		    (setq tab-width 4)
		    (setq c-basic-offset 4)
                    'turn-on-auto-fill))
(add-hook 'perl-mode-hook 
	'(lambda () (font-lock-mode 1)
                    (setq fill-column 71)
		    (setq tab-width 4)
		    (setq c-basic-offset 4)
                    'turn-on-auto-fill))
(add-hook 'sml-mode-hook
	  '(lambda () (font-lock-mode 1)
			   (setq fill-column 71)
		   (setq tab-width 4)
		   (setq c-basic-offset 4)
				   'turn-on-auto-fill))

(add-hook 'text-mode-hook 'turn-on-hscroll)
(add-hook 'c-mode-hook 'turn-on-hscroll)
(add-hook 'c++-mode-hook 'turn-on-hscroll)

;; C# mode
;;(require 'csharp-mode)
(add-hook 'csharp-mode-hook
          '(lambda()
             (setq comment-column 40)
             (setq c-basic-offset 4)
             (font-lock-add-magic-number)
             ;; オフセットの調整
             (c-set-offset 'substatement-open 0)
             (c-set-offset 'case-label '+)
             (c-set-offset 'arglist-intro '+)
             (c-set-offset 'arglist-close 0)
             )
          )
(autoload 'csharp-mode "csharp-mode" "C# editing mode." t)

;; Set Default Compiler Command
(setq-default compile-command "mcs ")

;; Set Key
(global-set-key "\C-x\c" 'compile)

;;;
;;; 選択領域を反転
;;;
(transient-mark-mode 1)

;;;
;;; 矩形範囲の選択(範囲選択中にC-SPC)
;;;
(autoload 'sense-region-on "sense-region"
          "System to toggle region and rectangle." t nil)
(sense-region-on)

;;;
;;; GNU global(gtags)の設定
;;;
(when (locate-library "gtags") (require 'gtags))
(global-set-key "\M-t" 'gtags-find-tag)     ;関数の定義元へ
(global-set-key "\M-r" 'gtags-find-rtag)    ;関数の参照先へ
(global-set-key "\M-s" 'gtags-find-symbol)  ;変数の定義元/参照先へ
(global-set-key "\M-p" 'gtags-find-pattern)
(global-set-key "\M-f" 'gtags-find-file)    ;ファイルにジャンプ
(global-set-key [?\C-,] 'gtags-pop-stack)   ;前のバッファに戻る
(add-hook 'c-mode-common-hook
          '(lambda ()
             (gtags-mode 1)))

;;;
;;; cygwin-mount
;;;
(setq cygwin-mount-cygwin-bin-directory "C:/cygwin/bin")

(when (and (featurep 'meadow) (locate-library "cygwin-mount"))
  (require 'cygwin-mount)
  (cygwin-mount-activate))

;;;
;;; grep結果バッファでのカーソル移動でダイナミックにファイルを開いてくれる
;;;
(require 'color-grep)
(setq color-grep-sync-kill-buffer t)

;;;
;;; M-x grep-by-ack
;;; Perlのackコマンドを使ったgrep(カーソル付近の単語をデフォルトの検索語に)
;;;
(defun grep-by-ack ()
  "grep the whole directory for something defaults to term at cursor position"
  (interactive)
  (setq default-word (thing-at-point 'symbol))
  (setq needle1 (or (read-string (concat "ack for <" default-word ">: ")) default-word))
  (setq needle1 (if (equal needle1 "") default-word needle1))
  (setq default-dir default-directory)
  (setq needle2 (or (read-string (concat "target directory <" default-dir ">: ")) default-dir))
  (setq needle2 (if (equal needle2 "") default-dir needle2))
;;;  (grep-find (concat "ack-grep.pl --nocolor --nogroup " needle1 " " needle2)))
;;;  (grep-find (concat "ack-grep.pl --nogroup " needle1 " " needle2)))
;;;    (grep-find (concat "ack.pl " needle1 " " needle2)))
  (grep-find (concat "ack-grep.pl --nogroup " needle1 " " needle2 " < /dev/null")))
;;;  (grep-find (concat "ack-standalone.pl --nogroup " needle1 " " needle2)))

;;;
;;; M-x grepでPerlのackコマンドを使うよう変更
;;;
(global-set-key "\M-g" (lambda () (interactive) (grep-by-ack)))

;;;
;;; 動かないackのテスト
;;;
(defvar ack-command "ack-grep.pl --nogroup --nocolor ")
(defvar ack-history nil)
(defvar ack-host-defaults-alist nil)
(defun ack ()
  "Like grep, but using ack-command as the default"
  (interactive)
  ; Make sure grep has been initialized
  (if (>= emacs-major-version 22)
      (require 'grep)
    (require 'compile))
  ; Close STDIN to keep ack from going into filter mode
;  (let ((null-device (format "< %s" null-device))
    (let ((null-device (format "< /dev/null" null-device))
        (grep-command ack-command)
        (grep-history ack-history)
        (grep-host-defaults-alist ack-host-defaults-alist))
    (call-interactively 'grep)
    (setq ack-history             grep-history
          ack-host-defaults-alist grep-host-defaults-alist)))

;;;
;;; default frameデフォルト
;;;              
;;;
(setq default-frame-alist
      (append (list
		    '(ime-font . (w32-logfont "BDF M+"
					      0 13 400 0 nil nil nil
					      128 1 3 49)) ; TrueType のみ
		    '(font . "BDF M+ 12"); mplus
		    '(width . 96)
		    '(height . 60)
		    '(top . 1)
		    '(left . 1)
		    '(line-spacing . 1)
		    )
	      default-frame-alist))

;;;
;;; ac-mode
;;;
(load "ac-mode")

(setq ac-mode-exception '(dired-mode hex-mode))
(add-hook 'find-file-hooks 'ac-mode-without-exception)
(setq ac-mode-goto-end-of-word t)

;;;
;;;howm
;;;
(setq howm-menu-lang 'ja)
(global-set-key "\C-c,," 'howm-menu)
(autoload 'howm-menu "howm-mode" "Hitori Otegaru Wiki Modoki" t)

;;; タイトルの書式
(setq howm-template "Subject: %date-1 %title%cursor\nDate: %date %file\n\n")
(setq howm-template-date-format "[%Y-%m-%d]")

;;; 一覧の書式
(setq howm-view-summary-format ">>")          ;; ファイル名でなく">>"を表示
(setq howm-view-title-header "Subject:")      ;; 一覧のタイトルの行頭
(setq howm-list-title t)                      ;; 一覧にタイトルを表示

;;; 内容が 0 ならファイルごと削除する
(if (not (memq 'delete-file-if-no-contents after-save-hook))
    (setq after-save-hook
          (cons 'delete-file-if-no-contents after-save-hook)))
(defun delete-file-if-no-contents ()
  (when (and
         (buffer-file-name (current-buffer))
         (string-match "\\.howm" (buffer-file-name (current-buffer)))
         (= (point-min) (point-max)))
    (delete-file
     (buffer-file-name (current-buffer)))))

;;;
;;; emacs-w3m
;;;
(require 'mime-w3m)


;;;
;;;Wanderlust
;;;

;;(add-to-list 'load-path "~/work/wl-2.14.0/wl")
;;(add-to-list 'load-path "~/work/wl-2.14.0/elmo")

;; autoload の設定
;; (XEmacs の package としてインストールした場合は必要ありません)
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; アイコンを置くディレクトリ。初期設定は Emacs 固有のデフォルト値。
;; (デフォルトの値が正しければ必要ありません)
;;(setq wl-icon-directory "~/work/wl/etc")

;; メールを送信する SMTP サーバ。 初期設定は nil。
(setq wl-smtp-posting-server "mx1.su.casio.co.jp")
;; ニュース投稿用の NNTP サーバ。 初期設定は nil。
;;(setq wl-nntp-posting-server "your.nntp.example.com")
(custom-set-variables
 '(load-home-init-file t t))
(custom-set-faces)

;;;
;;; 分割画面のサイズ移動
;;; C-c C-rののちにhjklのどれかを押す
;;;
(global-set-key "\C-c\C-r" 'window-resizer)

(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        c)
    (catch 'end-flag
      (while t
        (message "size[%dx%d]"
                 (window-width) (window-height))
        (setq c (read-char))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (message "Quit")
               (throw 'end-flag t)))))))

;;;
;;; Ruby mode
;;;
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(setq auto-mode-alist (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-indent-level 2)
(setq ruby-indent-tabs-mode nil)