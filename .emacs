;;;
;;;$B4pK\$N354Q(B
;;;

(set-background-color "gray82")

;;;
;;;MULE-UCS$B$N@_Dj(B
;;;
(require 'un-define) ; Unicode
(require 'jisx0213)  ; JIS X 0213

;;;
;;;$BF|K\8l4D6-$N4pK\@_Dj(B
;;;
(set-language-environment "Japanese")
(mw32-ime-initialize)
(setq default-input-method "MW32-IME")

;;;
;;;$B%U%)%s%H@_Dj%b%8%e!<%k$NFI$_9~$_(B
;;;
;;;
;$B0J2<$N(B3$B9T$N$=$l$>$l9TKv$G(BC-x C-e$B$r<B9T$7$?$H$-$KF@$i$l$k%j%9%H$r(B
;$B$r85$K$7$F!"%U%)%s%H$r@_Dj$9$k!#(B
;(setq eval-expression-print-level nil)
;(setq eval-expression-print-length nil)
;(w32-query-get-logfont)
;;;
(when (require 'font-setup nil t)
  (setq font-setup-bdf-dir "C:/Meadow/packages/fonts/intlfonts-1.2.1")
  (font-setup "$BElIw%4%7%C%/(B" 1)
  (font-setup "$B#M#S(B $B%4%7%C%/(B" 49 t)
  (font-setup "$BElIwL@D+(B" 1 t)
  (font-setup "$B#M#S(B $BL@D+(B" 17 t))

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
;;; $B9T4VD4@0(B
;;;
(setq-default line-spacing 1)

;;;
;;;$B%a%K%e!<$NF|K\8l2=(B
;;;
(require 'menu-tree)

;;;
;;;$B%D!<%k%P!<HsI=<((B
;;;
(tool-bar-mode nil)

;;;
;;;Windows IME $B$N(B ON/OFF $B>uBV$r%b!<%I%i%$%s$KI=<($9$k(B
;;;
(setq mw32-ime-show-mode-line t) ; $B%G%U%)%k%H$G(B t$B!JI=<($9$k!K!#(B
;;;
;;;$B%b!<%I%i%$%s$KI=<($5$l$k(B IME $B$N%$%s%8%1!<%?$r%+%9%?%^%$%:$9$k(B
;;; OFF : [--]
;;;; ON  : [$B$"(B]
(setq-default mw32-ime-mode-line-state-indicator "[--]")
(setq mw32-ime-mode-line-state-indicator "[--]")
(setq mw32-ime-mode-line-state-indicator-list
      '("[--]" "[$B$"(B]" "[--]"))

;;;
;;; font-lock$B@_Dj(B
;;;
(global-font-lock-mode t)

;;;
;;;$B:81&$N%9%Z!<%9$K%"%$%3%s=P$5$J$$(B
;;;
;;;(set-face-foreground 'fringe (face-background 'fringe))

;;;
;;;$B%+!<%=%k$NE@LGDd;_(B
;;;
(blink-cursor-mode 0)

;;;
;;; $B%?%VI}$N;XDj(B(4$BJ8;zJ,(B)
;;;
(setq tab-width 4)

;;;80$BJ8;z$G<+F02~9T(B
;;;(setq fill-column 80)
;;;(setq text-mode-hook 'turn-on-auto-fill)
;;;(setq default-major-mode 'text-mode)

;;; $B%P%C%/%"%C%W%U%!%$%k:n$i$J$$(B
(setq make-backup-files nil)

;;; $B8=:_$N4X?tL>I=<(%b!<%I(B
(which-function-mode 1)

;;; $B%*!<%H%9%/%m!<%k$O(B1$B9T$E$D(B
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)

;;; $B%+!<%=%k0LCV$ND4@0(B
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
	  (forward-line (/ (window-height) 2)) ; $BH>2hLL(B
;	  (forward-line (- (window-height) 4)) ; $BA42hLL(B
	  (recenter -1))))

(global-set-key "\M-v" 'exp-pageup)
(global-set-key [prior] 'exp-pageup)
(defun exp-pageup () "Page Up"
  (interactive)
  (if (/= (window-start) (point))
	  (goto-char (window-start))
	(progn
	  (forward-line (- 0 (/ (window-height) 2))) ; $BH>2hLL(B
;	  (forward-line (- 3 (window-height))) ; $BA02hLL(B
	  (recenter 0))))

;;
;;$BJ,3d2hLL$rF~$lBX$($k(B swap screen
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


;;; $B%9%Z!<%9$G$J$/(Btab(4$BJ8;zJ,(B)$B$G%$%s%G%s%H(B
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
             ;; $B%*%U%;%C%H$ND4@0(B
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
;;; $BA*BrNN0h$rH?E>(B
;;;
(transient-mark-mode 1)

;;;
;;; $B6k7AHO0O$NA*Br(B($BHO0OA*BrCf$K(BC-SPC)
;;;
(autoload 'sense-region-on "sense-region"
          "System to toggle region and rectangle." t nil)
(sense-region-on)

;;;
;;; GNU global(gtags)$B$N@_Dj(B
;;;
(when (locate-library "gtags") (require 'gtags))
(global-set-key "\M-t" 'gtags-find-tag)     ;$B4X?t$NDj5A85$X(B
(global-set-key "\M-r" 'gtags-find-rtag)    ;$B4X?t$N;2>H@h$X(B
(global-set-key "\M-s" 'gtags-find-symbol)  ;$BJQ?t$NDj5A85(B/$B;2>H@h$X(B
(global-set-key "\M-p" 'gtags-find-pattern)
(global-set-key "\M-f" 'gtags-find-file)    ;$B%U%!%$%k$K%8%c%s%W(B
(global-set-key [?\C-,] 'gtags-pop-stack)   ;$BA0$N%P%C%U%!$KLa$k(B
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
;;; grep$B7k2L%P%C%U%!$G$N%+!<%=%k0\F0$G%@%$%J%_%C%/$K%U%!%$%k$r3+$$$F$/$l$k(B
;;;
(require 'color-grep)
(setq color-grep-sync-kill-buffer t)

;;;
;;; M-x grep-by-ack
;;; Perl$B$N(Back$B%3%^%s%I$r;H$C$?(Bgrep($B%+!<%=%kIU6a$NC18l$r%G%U%)%k%H$N8!:w8l$K(B)
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
;;; M-x grep$B$G(BPerl$B$N(Back$B%3%^%s%I$r;H$&$h$&JQ99(B
;;;
(global-set-key "\M-g" (lambda () (interactive) (grep-by-ack)))

;;;
;;; $BF0$+$J$$(Back$B$N%F%9%H(B
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
;;; default frame$B%G%U%)%k%H(B
;;;              
;;;
(setq default-frame-alist
      (append (list
		    '(ime-font . (w32-logfont "BDF M+"
					      0 13 400 0 nil nil nil
					      128 1 3 49)) ; TrueType $B$N$_(B
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

;;; $B%?%$%H%k$N=q<0(B
(setq howm-template "Subject: %date-1 %title%cursor\nDate: %date %file\n\n")
(setq howm-template-date-format "[%Y-%m-%d]")

;;; $B0lMw$N=q<0(B
(setq howm-view-summary-format ">>")          ;; $B%U%!%$%kL>$G$J$/(B">>"$B$rI=<((B
(setq howm-view-title-header "Subject:")      ;; $B0lMw$N%?%$%H%k$N9TF,(B
(setq howm-list-title t)                      ;; $B0lMw$K%?%$%H%k$rI=<((B

;;; $BFbMF$,(B 0 $B$J$i%U%!%$%k$4$H:o=|$9$k(B
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

;; autoload $B$N@_Dj(B
;; (XEmacs $B$N(B package $B$H$7$F%$%s%9%H!<%k$7$?>l9g$OI,MW$"$j$^$;$s(B)
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; $B%"%$%3%s$rCV$/%G%#%l%/%H%j!#=i4|@_Dj$O(B Emacs $B8GM-$N%G%U%)%k%HCM!#(B
;; ($B%G%U%)%k%H$NCM$,@5$7$1$l$PI,MW$"$j$^$;$s(B)
;;(setq wl-icon-directory "~/work/wl/etc")

;; $B%a!<%k$rAw?.$9$k(B SMTP $B%5!<%P!#(B $B=i4|@_Dj$O(B nil$B!#(B
(setq wl-smtp-posting-server "mx1.su.casio.co.jp")
;; $B%K%e!<%9Ej9FMQ$N(B NNTP $B%5!<%P!#(B $B=i4|@_Dj$O(B nil$B!#(B
;;(setq wl-nntp-posting-server "your.nntp.example.com")
(custom-set-variables
 '(load-home-init-file t t))
(custom-set-faces)

;;;
;;; $BJ,3d2hLL$N%5%$%:0\F0(B
;;; C-c C-r$B$N$N$A$K(Bhjkl$B$N$I$l$+$r2!$9(B
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