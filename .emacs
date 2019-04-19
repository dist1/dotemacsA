;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs  Version 1.01  <Sat Oct  1 08:26:46 2011>
;; 
;; Mo Norman
;; Licensed under Creative Commons Attribution-NonCommercial-ShareAlike 
;; 3.0 Unported License
;; http://l-ts.me
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path (expand-file-name "~/.emacs-elisp"))

(setq fancy-splash-image "~/.emacs-elisp/mnls.jpg")


;;-------------------- 按键设置 --------------------
;;speedbar
(global-set-key [f6] 'speedbar)
;;取消tab键对齐
(setq-default indent-tabs-mode nil)
;;next window
(global-set-key [(control \')] 'next-multiframe-window)
;;eshell
(global-set-key [(control \;)] 'eshell)
;;gdb按键设置
(global-set-key [(f8)] 'gud-step)
(global-set-key [(f7)] 'gud-next)
(global-set-key [(f4)] 'gud-until);;Recover kmacro-end-or-call-macro
;; (global-set-key [(f11)] 'gud-remove)
(global-set-key "\C-cf" 'gud-finish)
(global-set-key "\C-cs" 'gud-start)
(global-set-key "\C-cg" 'gud-go)
(global-set-key "\C-ct" 'gud-cont)
(global-set-key "\C-cw" 'gud-watch)

;;-------------------- 普通设定 --------------------
;;默认路径
(setq default-direct "~/src/")
;;开启行号
(global-linum-mode t)
;;设置中文标点
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)
;;设置字体
(set-default-font "黑体-12")
;;(set-frame-font "Monaco-10")
;;(set-fontset-font "fontset-default" 'han "文泉驿等宽正黑-12")
;;取消滚动条
(customize-set-variable 'scroll-bar-mode nil);
;;不产生临时文件
(setq-default make-backup-file nil);
;;开启ido（输入文件提示）
(ido-mode t)
;;禁用启动信息
;;(setq inhibit-startup-message t)
;;括号匹配
(show-paren-mode t)
;;语法高亮
(global-font-lock-mode t)
;;高亮显示选中块
(transient-mark-mode t)
;;默认Text Mode
(setq default-major-mode 'text-mode)
;;支持外部拷贝粘贴
(setq x-select-enable-clipboard t)
;;C-k删除整行到末尾
(setq-default kill-whole-line t)
;;删除保存记录为200
(setq kill-ring-max 200)
;;设置Tab宽度
(setq default-tab-width 4)
;;约会提醒
(setq appt-issue-message t)
;;取消滚动栏
(set-scroll-bar-mode nil)
;;显示图片
(auto-image-file-mode)
;;设置标题
(setq frame-title-format "%f@emacs")
;;全屏模式
(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                             (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))
(global-set-key [f11] 'toggle-fullscreen)
(add-hook 'emacs-startup-hook 'toggle-fullscreen)
;;取消菜单
(tool-bar-mode 0)

;;-------------------- 代码缩写 --------------------
;;(add-to-list 'load-path "~/.emacs-elisp/msf-abbrev")
;;(require 'msf-abbrev)
;;(setq msf-abbrev-verbose t)
;;(set 'msf-abbrev-root "~/.emacs-elisp/msf-abbrev/abbrev")
;;(global-set-key (kbd "C-c l") ‘msf-abbrev-goto-root)
;;(global-set-key (kbd "C-c a") ‘msf-abbrev-define-new-abbrev-this-mode)

;;-------------------- common display setting --------------------
;     设置显示底边栏(时间,行列号)，配色(背景、高亮、日历)，字体
;-----------------------------------------------------------------
;;底边栏-时间
;;(setq display-time-24hr-format t)
;;(setq display-time-use-mail-icon t);;邮件设置图标
;;(setq display-time-interval 10);;时间更新频率
;;(display-time-mode 1)
;;底边栏-行列号
(column-number-mode t)
;;字体
;;(set-default-font "10x5")
;;配色-背景
;;(set-cursor-color "blue")
;;(set-mouse-color "white")
;;(set-foreground-color "white")
;;(set-background-color "darkblue")
;;配色-高亮
;;(set-face-foreground 'highlight "white")
;;(set-face-background 'highlight "blue")
;;(set-face-foreground 'region "cyan")
;;(set-face-background 'region "blue")
;;(set-face-foreground 'secondary-selection "skyblue")
;;(set-face-background 'secondary-selection "darkblue")
;;配色-日历
;;(setq calendar-load-hook
;;'(lambda ()
;;(set-face-foreground 'diary-face "skyblue")
;;(set-face-background 'holiday-face "slate blue")
;;(set-face-foreground 'holiday-face "white")))

;;-------------------- 鼠标 --------------------
;;     鼠标自动弹开指针，滚动3行
;;---------------------------------------------
;;鼠标自动弹开指针
(mouse-avoidance-mode 'animate)
;;默认的滚动太快，这里改为3行
(defun up-slightly () (interactive) (scroll-up 3))
(defun down-slightly () (interactive) (scroll-down 3))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)

;;-------------------- 字体解码顺序 --------------------
;;     设置默认解码顺序
;;     from 王垠
;;----------------------------------------------------
;; (setq font-encoding-alist
;;       (append '(("MuleTibetan-0" (tibetan . 0))
;;                 ("GB2312" (chinese-gb2312 . 0))
;;                 ("BIG5" (big5 . 0))
;;                 ("JISX0208" (japanese-jisx0208 . 0))
;;                 ("JISX0212" (japanese-jisx0212 . 0))
;;                 ("VISCII" (vietnamese-viscii-lower . 0))
;;                 ("KSC5601" (korean-ksc5601 . 0))
;;                 ("MuleArabic-0" (arabic-digit . 0))
;;                 ("MuleArabic-1" (arabic-1-column . 0))
;;                 ("MuleArabic-2" (arabic-2-column . 0))) font-encoding-alist))
;;(require `unicad)
;;写文件的编码方式
(set-buffer-file-coding-system 'utf-8)
;;新建文件的编码方式
(setq default-buffer-file-coding-system 'utf-8)
;;读取或写入文件名的编码方式
(setq file-name-coding-system 'utf-8) 

;;-------------------- Smart Compile --------------------
;;    Load the smart-compile+ .                         .
;;-------------------------------------------------------
(require 'smart-compile+)
(global-set-key [(f9)] 'smart-compile)

;;-------------------- gdb设置 --------------------
;;     多窗口gdb
;;------------------------------------------------ 
(setq gdb-many-windows t)
;;(setq gdb-use-separate-io-buffer t)

;;-------------------- clang-completion-mode --------------------
;;(load-library "clang-completion-mode")

;;-------------------- 重定义注释方法 --------------------
;; 没有任中任何区域时，注释、反注释作用于当前行，否则作用于
;; 选中区域
;;-----------------------------------------------------
(defadvice comment-or-uncomment-region (before slickcomment activate compile)
  "When called interactively with no active region, toggle comment on current line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
(global-set-key (kbd "C-.") 'comment-or-uncomment-region)

;;-------------------- 重定义删除行 --------------------
;;     T_T目前不知道作用
;;     When called interactively with no active 
;;     region, copy a single line instead.When 
;;     called interactively with no active region,
;;     kill a single line instead.”
;;----------------------------------------------------
(defadvice kill-ring-save (before slickcopy activate compile)
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
(defadvice kill-region (before slickcut activate compile)
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

;;-------------------- Auto Header --------------------
;;     自动添加文件头
;;     Auto-header defines the following global keys:
;;         C-x C-h m    -- Create header.
;;         C-x C-h c    -- Increase the update counter.
;;         C-x C-h i    -- Insert header field (prompted for in minibuffer).
;;         C-x C-h r    -- Make revision entry.  Turns on auto-fill.
;;         C-x C-h g    -- Goto field within header.  Turns on auto-fill.
;;         C-x C-h f    -- Insert function header.
;;         C-x C-h a    -- Toggle auto-fill-mode for headers.
;;-----------------------------------------------------
(require 'auto-header)
(setq header-sysu-name "Mo Norman")
(setq header-sysu-sno "11331247" )
(setq header-email-address "LTaoist@163.com")
;; 设置每次保存时要更新的项目
(setq header-update-on-save '(filename
			      modified
			      counter
			      copyright
			      ))
;; 设置文件头的显示格式
(setq header-field-list '(
			  ;;filename  ;;文件名
              ;;version
			  ;;blank	    ;空行，下同
			  ;;description	;描述
              ;;blank 
			  ;;text-2	;作者+SNO
			  ;;created	;创建时间
              text-1
			  ;;modified_by	;更改者
			  ;;blank
			  ;;status	;状态，是否发布
			  ;;update	;更新
			  ;;blank
			  ))
;(setq header-copyright-notic
;(setq header-function-hdrstyle

;;-------------------- php mode --------------------
;     Load the php-mode                            .
;     @ .emacs-elisp/php-mode/                     .
;---------------------------------------------------
(add-to-list 'load-path (expand-file-name "~/.emacs-elisp/php-mode"))
(require 'php-mode)
(add-hook 'php-mode-hook
	'(lambda () (define-abbrev php-mode-abbrev-table "ex" "extends")))

;;-------------------- html-helper-mode --------------------
;    Set up the html-helper-mode.                          .
;-----------------------------------------------------------
(setq html-helper-build-new-buffer nil)

;;-------------------- mmm mode --------------------
;     Load the mmm-mode                            .
;     @.emacs-elisp/mmm-mode/                      .
;;--------------------------------------------------
;; (add-to-list 'load-path (expand-file-name "~/.emacs-elisp/mmm-mode"))
;; (require 'mmm-mode)
;; (require 'mmm-auto)
;; (setq mmm-global-mode 'maybe)
;; (mmm-add-mode-ext-class 'html-mode "\\.php\\'" 'html-php)
;; (mmm-add-mode-ext-class 'html-mode nil 'mason)
;; (mmm-add-mode-ext-class nil "\\.nw\\'" 'noweb)

;;-------------------- cc mode --------------------
;     Setting up the CC mode .                    .
;                                                 .
;     :[Tab-Width]      : 4                       .
;                                                 .
;     & compile         : F9                      .
;     & gdb             : F5                      .
;     & speedbar        : F6                      .
;     & c-indent        : M-`                     .
;                                                 .
;     based on lertsau                            .
;;-------------------------------------------------
(require 'cc-mode)
;space setting
(setq c-basic-offset 4)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)
;;c模式设置
(defun my-c-mode-common-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  ;;; hungry-delete and auto-newline
  ;;(c-set-style "linux")
  (c-toggle-auto-hungry-state 1)
  ;;按键定义
  (define-key c-mode-base-map [(return)] 'newline-and-indent)
  (define-key c-mode-base-map [(f5)] 'gdb)
  (define-key c-mode-base-map [(f6)] 'speedbar)
  (define-key c-mode-base-map [(meta \`)] 'c-indent-command)
  (define-key c-mode-base-map [(control tab)] 'my-indent-or-complete)
  (define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)
  ;;预处理
  (setq c-macro-shrink-window-flag t)
  (setq c-macro-preprocessor "cpp")
  (setq c-macro-cppflags " ")
  (setq c-macro-prompt-flag t)
  (setq abbrev-mode t))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
;;代码折叠
(add-hook 'c-mode-common-hook 'hs-minor-mode)
;;我的C++语言编辑策略
(defun my-c++-mode-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  (c-set-style "stroustrup"))

;;-------------------- Auto Complete --------------------
;;     自动补齐
;;-------------------------------------------------------
(add-to-list 'load-path "~/.emacs-elisp/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs-elisp/auto-complete//ac-dict")
(ac-config-default)
(put 'upcase-region 'disabled nil)

;;-------------------- w3m --------------------
(setq w3m-default-display-inline-images t)
(setq w3m-home-page "http://www.google.com")
(setq w3m-default-display-inline-images t)
(setq w3m-use-mule-ucs t)
(setq w3m-use-cookies t)
;;设定w3m的语言设置，以便方便使用和阅读中文-用了就乱码
;;;;书签解码设置
;; (setq w3m-bookmark-file-coding-system 'chinese-iso-8bit)
;; ;;;;w3m的解码设置，后面最好都有，我也不详解了
;; (setq w3m-coding-system 'chinese-iso-8bit)
;; (setq w3m-default-coding-system 'chinese-iso-8bit)
;; (setq w3m-file-coding-system 'chinese-iso-8bit)
;; (setq w3m-file-name-coding-system 'chinese-iso-8bit)
;; (setq w3m-terminal-coding-system 'chinese-iso-8bit)
;; (setq w3m-input-coding-system 'chinese-iso-8bit)
;; (setq w3m-output-coding-system 'chinese-iso-8bit)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes (quote ("3580fb8e37ee9e0bcb60762b81260290329a97f3ca19249569d404fce422342f" default)))
 '(delete-selection-mode nil)
 '(mark-even-if-inactive t)
 '(menu-bar-mode nil)
 '(safe-local-variable-values (quote ((todo-categories "test" "Personal") (encoding . utf8))))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;-------------------- Python --------------------


;;------------------------- Org-mode -------------------------
(setq org-hide-leading-stars t)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done 'time)

(defun insert-loli ()
  "Insert the latest loli into current buffer."
  (interactive)
  (newline)
  (let ((filename (shell-command-to-string
                   "readlink -n ~/loliday/latest")))
    (message filename)
    (insert-image (create-image filename)))
  (start-process "loli-process" "*Messages*"  "~/loliday/loli.sh")
  (newline)
  (newline))
(global-set-key (kbd "C-h 0") `insert-loli)

;(add-hook 'eshell-proc-load-hook
;          '(lambda nil
;             (insert-loli)
;             (eshell-send-input "*eshell*")
;             ))
;;-------------------- cscope --------------------
(add-hook 'c-mode-common-hook
	  '(lambda ()
	    (require 'xcscope)))

;;; Always do syntax highlighting
(global-font-lock-mode 1)

;;; Also highlight parens
(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(show-paren-mode 1)

;;; This is the binary name of my scheme implementation
(setq scheme-program-name "guile")

;;-------------------- Color theme --------------------
;;     配色管理。
;;-----------------------------------------------------
;; (require 'color-theme)
;; (color-theme-gray30)
(add-to-list 'custom-theme-load-path "~/.emacs-elisp/themes")
(load-theme 'dracula t)
