(setq default-major-mode 'text-mode)
(setq default-directory "~/dev")
(setq vc-handled-backends nil)

(cua-mode 1)
(ido-mode 1)
(show-paren-mode 1)
(which-func-mode 1)
(global-linum-mode 1)
(column-number-mode 1)
(delete-selection-mode 1)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(scroll-bar-mode 0)                    
(tool-bar-mode 0)
(menu-bar-mode 0)
;;(electric-pair-mode 1)
;;(mouse-avoidance-mode 'animate)

(setq visible-bell t)
(setq inhibit-startup-message t)
(setq frame-title-format "%b@Emacs")
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq enable-recursive-minibuffers t)
(setq backup-by-copying t)
(setq x-select-enable-clipboard t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq ediff-split-window-function 'split-window-horizontally)
;;sets a bookmark will also save your bookmarks
(setq bookmark-save-flag 1)


(global-set-key [f3] 'global-linum-mode)
(global-set-key [f4] 'revert-buffer)
(global-set-key [f11] 'find-dired)
(global-set-key [f12] 'undo)

(global-set-key (kbd "C-x j") 'goto-line)
(global-set-key (kbd "C-x k") 'kill-buffer-and-window)
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)
(global-set-key (kbd "C-u") 'undo)
(global-set-key (kbd "C-j") '(lambda () (interactive) (end-of-line) (newline-and-indent)))
(global-set-key (kbd "C-x t") '(lambda ()(interactive) (mapc 'kill-buffer (delq (current-buffer) (buffer-list))) (delete-other-windows)))
(global-set-key (kbd "C-c d") '(lambda ()(interactive) (insert "import pdb;pdb.set_trace()") (save-buffer)))

(global-set-key [ M-left ] 'windmove-left ) ; move to left windnow
(global-set-key [ M-right ] 'windmove-right ) ; move to right window
(global-set-key [ M-up ] 'windmove-up ) ; move to upper window
(global-set-key [ M-down ] 'windmove-down ) ; move to downer window
(global-set-key (kbd "<C-left>") 'windmove-left ) ; move to left windnow
(global-set-key (kbd "<C-right>") 'windmove-right ) ; move to right window
(global-set-key (kbd "<C-up>") 'windmove-up ) ; move to upper window
(global-set-key (kbd "<C-down>") 'windmove-down ) ; move to downer window
(global-set-key (kbd "ESC <right>") 'windmove-right)
(global-set-key (kbd "ESC <left>") 'windmove-left)
(global-set-key (kbd "ESC <up>") 'windmove-up)
(global-set-key (kbd "ESC <down>") 'windmove-down)
(global-set-key (kbd "RET") 'newline-and-indent)

;; Mac OS
(setq mac-option-modifier 'alt)
(setq mac-command-modifier 'meta)
(global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;; Pkgs:
;;yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(setq yas/snippet-dirs "~/.emacs.d/plugins/yasnippet/snippets")
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")


;;autocomplete
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete/dict")
(ac-config-default)

;; Ruby
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . html-erb-mode))
(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . html-erb-mode))
(defun my-erb-mode-hook ()
    "Hooks for Web mode."
      (setq web-mode-markup-indent-offset 2)
      )
(add-hook 'html-erb-mode-hook  'my-erb-mode-hook)
             
(setq auto-mode-alist
    (cons '("\\.less" . css-mode) auto-mode-alist))

(setq auto-mode-alist
    (cons '("\\.scss" . css-mode) auto-mode-alist))
