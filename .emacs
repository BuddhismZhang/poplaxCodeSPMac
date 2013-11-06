;; 插件配置路径
(add-to-list 'load-path "~/emacs-plugins/")
(add-to-list 'load-path "~/emacs-plugins/mylisp")
(add-to-list 'load-path "~/emacs-plugins/company")

(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; wiki
;;(add-to-list 'load-path "~/emacs-plugins/emacs-wiki")
;;(require 'emacs-wiki)

;; --------------------------------

;; Coding system
(set-buffer-file-coding-system 'unix t)
(prefer-coding-system 'utf-8)
;; --------------------------------
;; Unix code
(global-set-key (kbd "<f8>")
(lambda() t
	(Interactive)
	(set-buffer-file-coding-system 'unix t)
	(save-buffer)))
;; --------------------------------


;; ================================
;; 编辑器风格
;; Close Toolbar
;;(tool-bar-mode nil)
;; --------------------------------
;; 颜色配置
;; --------------------------------
;; 高亮行
(global-hl-line-mode t)
;; --------------------------------
;; 光标颜色设置
(set-cursor-color "white")
;; --------------------------------
;; 关闭烦人的出错时的提示声
(setq visible-bell t)
;; --------------------------------
;; 光标显示为一竖线
;;(setq-default cursor-type 'bar)
;; --------------------------------
;; 只渲染当前屏幕语法高亮，加快显示速度
;;(setq lazy-lock-defer-on-scrolling t)
;;(setq font-lock-support-mode 'lazy-lock-mode)
;;(setq font-lock-maximum-decoration t)
;; --------------------------------

;;tab & space
;;(global-set-key (kbd "TAB") 'self-insert-command);

;; ================================
;; 状态栏
;; 显示时间
(display-time)
;; 时间格式
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
;;(setq display-time-interval 10)
;; --------------------------------
;;显示列行号
;;(global-linum-mode t)
(setq column-number-mode t)
(setq line-number-mode t)

;; --------------------------------
;;标题栏显示 %f 缓冲区完整路径 %p 页面百分数 %l 行号
;;(setq frame-title-format "%f")
(setq frame-title-format 
	'("%S" (buffer-file-name "%f"
	(dired-directory dired-directory "%b"))))
;;初始化窗口尺寸大小
(setq default-frame-alist
      '((height . 200) (width . 130) (menu-bar-lines . 20) (tool-bar-lines . 0)))

;; --------------------------------

;;显示匹配括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;括号%
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
	(interactive "p")
	(cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))
;; --------------------------------

;; 我的设定
(require 'my-setting)

;; 代码片段yasnippet
(add-to-list 'load-path "~/emacs-plugins/yasnippet")
(require 'yasnippet-bundle)
(setq yas/prompt-functions '(yas/dropdown-prompt yas/completing-prompt))
;;(setq yas/prompt-functions '(yas/ido-prompt))
;; not yasnippet-bundle 自动补全
;;(require 'yasnippet)
;;(yas/initialize)
;;(yas/load-directory "~/emacs-plugins/yasnippet/snippets")
;;(setq yas/use-menu nil)
;; --------------------------------

;; hippie key auto-complete 自动补全
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list
	'(try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))
;; --------------------------------

;; auto complete 自动补全
(require 'auto-complete)
(global-auto-complete-mode t)
(setq ac-auto-start 3)
;;(setq ac-auto-start nil)
;;(global-set-key "\C-j" 'ac-start)
(define-key ac-complete-mode-map "\r" nil)
;;(define-key ac-complete-mode-map "\r" 'ac-complete)
(define-key ac-complete-mode-map "\t" 'ac-complete)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(setq ac-candidate-max 20)
;; --------------------------------

;;以y/n代表yes/no
(fset'yes-or-no-p 'y-or-n-p)
;; --------------------------------
;;关闭自动备份
(setq make-backup-files nil)
;;关闭自动保存模式
(setq auto-save-mode nil)
;;不生成 #filename# 临时文件
(setq auto-save-default nil)
;; --------------------------------
;;配置备份文档的路径
(setq backup-directory-alist '(("." . "~/emacs_backups")))
;; --------------------------------

;; ---- yank
;;(defadvice kill-ring-save (before slickcopy activate compile)
;;  "When called interactively with no active region, copy a single line instead."
;;  (interactive
;;   (if mark-active (list (region-beginning) (region-end))
;;     (list (line-beginning-position)
;;           (line-beginning-position 2)))))
;;(defadvice kill-region (before slickcut activate compile)
;;  "When called interactively with no active region, kill a single line instead."
;;  (interactive
;;   (if mark-active (list (region-beginning) (region-end))
;;     (list (line-beginning-position)
;;           (line-beginning-position 2)))))


;;tabbar
;;(require 'tabbar)
;;(tabbar-mode 1)
;;(setq tabbar-speedkey-use t)
;;(global-set-key (kbd "C-;") 'tabbar-backward)
;;(global-set-key (kbd "C-'") 'tabbar-forward)
;;(global-set-key (kbd "C-=") 'tabbar-backward-group)
;;(global-set-key (kbd "C--") 'tabbar-forward-group)
;; --------------------------------

;; org mode 写作模式
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(i!)" "HANGUP(h!)" "|" "DONE(d!)" "CANCEL(c!)")))
;; --------------------------------

;; my lua mode
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(add-hook 'lua-mode-hook 'turn-on-font-lock)

;; my perl mode
;;(require 'my-perl)
(require 'my-perl)

;; my php mode
(require 'my-php)

;; my python mode
(require 'my-python)

;; my cc mode
(require 'my-cc)

;; my trac wiki
;;(require 'trac-wiki)

;; my objc mode
;;(require 'my-objc)

(setq-default indent-tabs-mode nil)

(require 'color-theme)
(color-theme-initialize)
(color-theme-clarity)
;;(color-theme-classic)

(set-default-font "Menlo-13")
;;(set-default-font "Inconsolata-13")
;;(set-default-font "Lucida Console-13")
;;(set-default-font "Courier-12")
;;(set-default-font "Courier New-14")

;;Html tag
;;(setq sgml-basic-offset 4)
(add-hook 'html-mode-hook
          (lambda ()
            ;; Default indentation is usually 2 spaces, changing to 4.
            (set (make-local-variable 'sgml-basic-offset) 4)))

;;(add-hook 'sgml-mode-hook
;;          (lambda ()
;;            ;; Default indentation to 2, but let SGML mode guess, too.
;;            (set (make-local-variable 'sgml-basic-offset) 4)
;;            (sgml-guess-indent)))

;;(add-hook 'html-mode-hook
;;          (lambda()
;;            (setq indent-tabs-mode t)))
;;            (setq sgml-basic-offset 4)

;;(setq js2-mode-hook
;;      '(lambda () (progn
;;                    (set-variable 'indent-tabs-mode nil))))

;; install web mode
(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)
