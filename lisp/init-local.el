;;; customize for purcell/emacs.d

;;; Code:
(global-set-key (kbd "C-x f") 'projectile-find-file)
(global-set-key (kbd "C-c C-w") 'ivy-wgrep-change-to-wgrep-mode)

(require-package 'ag)

(require-package 'window-numbering)
(window-numbering-mode)

(require-package 'which-key)
(which-key-mode)

(require-package 'rjsx-mode)

;; string-inflection
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

;; yas
(require-package 'yasnippet)
(yas-global-mode 1)
(require-package 'yasnippet-snippets)
(global-set-key (kbd "C-c C-t") 'yas-describe-tables)


;; command log
(global-command-log-mode)

(provide 'init-local)
