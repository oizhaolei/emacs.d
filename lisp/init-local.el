;;; customize for purcell/emacs.d

;;; Code:
(global-set-key (kbd "C-x f") 'projectile-find-file)
(global-set-key (kbd "C-c C-q") 'ivy-wgrep-change-to-wgrep-mode)

(require-package 'ag)

(require-package 'window-numbering)
(window-numbering-mode)

(require-package 'which-key)
(which-key-mode)

(require-package 'rjsx-mode)

;;; string-inflection
(require-package 'string-inflection)
(global-set-key (kbd "C-c C-u") 'string-inflection-all-cycle)
(add-hook 'ruby-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c C-u") 'string-inflection-ruby-style-cycle)))
(add-hook 'java-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c C-u") 'string-inflection-java-style-cycle)))
(add-hook 'python-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c C-u") 'string-inflection-python-style-cycle)))

;;; yas
(require-package 'yasnippet)
(yas-global-mode 1)
(require-package 'yasnippet-snippets)
(global-set-key (kbd "C-c C-t") 'yas-describe-tables)

;;; tide
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;;(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

(provide 'init-local)
