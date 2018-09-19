;;; customize for purcell/emacs.d


(set-frame-position (selected-frame) 80 0)
(set-frame-size (selected-frame) 260 83)

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

;; neotree
(require-package 'neotree)
(global-set-key (kbd "C-c C-n") 'neotree-toggle)

;; crux
(require-package 'crux)
(global-set-key (kbd "C-c o") 'crux-open-with)
(global-set-key (kbd "C-c C-e") 'crux-eval-and-replace)

;; ivy
(require-package 'ivy)
(global-set-key (kbd "C-c s") 'swiper)
;;(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-c l") 'counsel-locate)
(global-set-key (kbd "C-c C-r") 'ivy-resume)


;;; lsp
(require 'lsp-javascript-typescript)

(add-hook 'js-mode-hook #'lsp-javascript-typescript-enable)
(add-hook 'typescript-mode-hook #'lsp-javascript-typescript-enable) ;; for typescript support
(add-hook 'js3-mode-hook #'lsp-javascript-typescript-enable) ;; for js3-mode support
(add-hook 'rjsx-mode #'lsp-javascript-typescript-enable) ;; for rjsx-mode support

;;
(defun kill-all-buffers ()
  "Kill all buffers."
  (interactive)
  (dolist (buffer (buffer-list))
    (kill-buffer buffer)))


(provide 'init-local)
