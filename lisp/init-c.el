;;; init-c.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; ;; C confuguration

(require-package 'cmake-mode)

;; ;; irony
;; (require-package 'irony)
;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'objc-mode-hook 'irony-mode)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;; ;; company-irony
;; (require-package 'company-irony)
;; (eval-after-load 'company '(add-to-list 'company-backends 'company-irony))
;; ;; flycheck-irony
;; (require-package 'flycheck-irony)
;; (eval-after-load 'flycheck
;;   '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
;; ;; irony-eldoc
;; (require-package 'irony-eldoc)
;; (add-hook 'irony-mode-hook #'irony-eldoc)

;;rtags
(require-package 'rtags)
(require-package 'company-rtags)
(require-package 'ac-rtags)
(require-package 'ivy-rtags)
(require-package 'flycheck-rtags)

(setq rtags-completions-enabled t)
(eval-after-load 'company
  '(add-to-list
    'company-backends 'company-rtags))
(setq rtags-autostart-diagnostics t)
(rtags-enable-standard-keybindings)
;; 设置快捷键
(define-key c-mode-base-map (kbd "M-.") (function rtags-find-symbol-at-point))
(define-key c-mode-base-map (kbd "M-,") (function rtags-find-references-at-point))
(define-key c-mode-base-map (kbd "M-;") (function rtags-find-file))
(define-key c-mode-base-map (kbd "C-.") (function rtags-find-symbol))
(define-key c-mode-base-map (kbd "C-,") (function rtags-find-references))

;; cmake-ide
(require-package 'cmake-ide)
(cmake-ide-setup)

(provide 'init-c)
