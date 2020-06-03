
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-archives
   (quote
    (("GNU ELPA" . "http://elpa.emacs-china.org/gnu/")
     ("Marmalade" . "http://elpa.emacs-china.org/marmalade/")
     ("MELPA" . "http://elpa.emacs-china.org/melpa/"))))
 '(package-selected-packages
   (quote
    (htmlize auto-complete auto-save-buffers-enhanced modeline-posn multi-term deft focus writeroom-mode ## pyim))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/"))

;;一般设置
(tool-bar-mode 0) ;;隐藏工具栏
;;(global-linum-mode t) ;;行号
(column-number-mode t) ;;状态栏显示行列信息
(show-paren-mode t) ;;括号匹配高粱
;;(global-hl-line-mode t) ;;当前行高亮
(setq auto-save-default nil) ;;不生成#文件
(setq backup-by-copying nil) ;;不生成~文件
;;状态栏统计字数
;;(require 'modeline-posn)
;;(size-indication-mode 1)
;;自动保存
(require 'auto-save)
(auto-save-enable)
(setq auto-save-silent t)

;;自动补全功能

;;编码问题
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8-unix)
(set-clipboard-coding-system 'utf-8-unix)
(set-file-name-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-next-selection-coding-system 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(setq locale-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;快捷键
(global-set-key [f1] 'info) ;;F1帮助
(global-set-key [f2] 'undo) ;;F2撤销
(global-set-key [f3] 'kill-this-buffer) ;;F3关闭当前buffer
(global-set-key [f9] 'buffer-menu) ;;F9打开buffer清单

;;关联text-mode和writeroom-mode以及focus-mode
(add-hook 'text-mode-hook
	  (function (lambda ()
		      (setq writeroom-width 45)
		      (writeroom-mode)
		      (focus-mode))))

;;关联org-mode和writeroom-mode
(add-hook 'org-mode-hook
	  (function (lambda ()
		      (setq writeroom-width 80)
		      (writeroom-mode))))
	  
;;快捷键调整writeroom模式的宽度
(with-eval-after-load 'writeroom-mode
  (define-key writeroom-mode-map (kbd "C-M-[") #'writeroom-decrease-width)
  (define-key writeroom-mode-map (kbd "C-M-]") #'writeroom-increase-width)
  (define-key writeroom-mode-map (kbd "C-M-^") #'writeroom-adjust-width))

(require 'use-package)

;;pyim设置
(pyim-basedict-enable)   ; 拼音词库，五笔用户 *不需要* 此行设置
(setq default-input-method "pyim")

(use-package pyim
;;  :ensure nil
  :config
  (setq pyim-default-scheme 'quanpin)    ;;全拼  
  (setq pyim-page-tooltip 'popup)  ;;使用 pupup-el 来绘制选词框
  (setq pyim-page-length 5) ;;选词框显示5个候选词
  (setq pyim-punctuation-translate-p '(auto yes no)) ;中文使用全角标点，英文使用半角标点。
  (define-key pyim-mode-map "." 'pyim-page-next-page)
  (define-key pyim-mode-map "," 'pyim-page-previous-page) ;;候选詞翻页

  :bind  ;;快捷键设置：M-j把拼音转化成中文
  (("M-j" . pyim-convert-code-at-point) ;与 pyim-probe-dynamic-english 配合
   ("C-;" . pyim-delete-word-from-personal-buffer)))

(pyim-isearch-mode 1) ;;开启拼音搜索功能
;; 激活 basedict 拼音词库
(use-package pyim-basedict
    :ensure nil
    :config (pyim-basedict-enable))

;; 设置 pyim 探针设置，行首自动半角符号
(setq-default pyim-punctuation-half-width-functions
              '(pyim-probe-punctuation-line-beginning
                pyim-probe-punctuation-after-punctuation))

;;全局切换输入法快捷键
(global-set-key (kbd "C-\\") 'toggle-input-method)

;;deft设置
(global-set-key [f11] 'deft)  ;;F11调用deft功能
(setq deft-directory "/home/dm200/orgmode-blog/src")
;;(setq deft-directory "/mnt/vfat/notes")
(setq deft-extensions '("txt" "org"))  ;;搜索两种模式
;;(setq deft-text-mode 'org-mode)
(setq deft-incremental-search nil)  ;;默认用正则表达式搜索
;;(setq deft-use-filename-as-title t)
(setq deft-recursive t)

;;org-mode设置
;;自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
;;导出为html
(setq org-html-doctype "html5")
(setq org-html-xml-declaration nil)
(setq org-html-postamble nil)
;;全局缩进
(setq org-startup-indented t)
