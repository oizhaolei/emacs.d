;;; init-local.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;; (setq url-proxy-services
;;       '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;;         ("http" . "localhost:61844")
;;         ("https" . "localhost:61844")))

(desktop-save-mode nil)
(set-frame-position (selected-frame) 80 0)
(set-frame-size (selected-frame) 260 83)
(setq
 split-width-threshold 0
 split-height-threshold nil)
;;; Code:
(global-set-key (kbd "C-c C-m") 'imenu)
(global-set-key (kbd "C-x f") 'projectile-find-file)

(require-package 'goto-last-change)
(require-package 'web-mode)
;;(require-package 'tern-auto-complete)
;;(require-package 'tern)
(require-package 'smartparens)
(require-package 'org-tree-slide)
(require-package 'counsel-tramp)
(require-package 'counsel-etags)
;;(require-package 'company-tern)
(require-package 'auto-complete)
(require-package 'undo-tree)
(require-package 'ag)
(require-package 'magithub)

(global-undo-tree-mode)
(magit-todos-mode)
;;
(require-package 'imenu-list)
(global-set-key (kbd "C-'") 'imenu-list-smart-toggle)

(require-package 'window-numbering)
(window-numbering-mode)

(require-package 'rjsx-mode)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("containers\\/.*\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("pages\\/.*\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("layouts\\/.*\\.js\\'" . rjsx-mode))

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

(require-package 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)

;;; yas
(require-package 'yasnippet)
(yas-global-mode 1)
(require-package 'yasnippet-snippets)
(global-set-key (kbd "C-c C-t") 'yas-describe-tables)

;; neotree
(require-package 'neotree)
(global-set-key (kbd "C-c C-n") 'neotree-toggle)

;; iedit
(require-package 'iedit)
(global-set-key (kbd "C-c ;") 'iedit-mode)

;; crux
(require-package 'crux)
(global-set-key (kbd "C-c o") 'crux-open-with)
(global-set-key (kbd "C-c C-e") 'crux-eval-and-replace)
(global-set-key (kbd "C-c m b") 'crux-create-scratch-buffer)

;; ivy
(require-package 'ivy)
(global-set-key (kbd "C-s") 'swiper)
;;(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-c l") 'counsel-locate)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

;; emmet
(require-package 'emmet-mode)
(require-package 'gist)

;; twitter
(require-package 'twittering-mode)
;; (setq twittering-proxy-use t)
;; (setq twittering-proxy-server "localhost")

;; google
(require-package 'google-this)
;;(require-package 'google-translate)
(global-set-key "\C-ct" 'google-translate-at-point)

;;plantuml
;;(require-package 'plantuml-mode)

;; reveal.js
;; (require-package 'ox-reveal)
;; (require-package 'org-reveal)


;; (when (maybe-require-package 'pdf-tools)
;;   (pdf-tools-install)
;;   ;; open pdfs scaled to fit page
;;   (setq-default pdf-view-display-size 'fit-page)
;;   ;; automatically annotate highlights
;;   (setq pdf-annot-activate-created-annotations t)
;;   ;; use normal isearch
;;   (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward))

;;
(defun my/kill-all-buffers ()
  "Kill all buffers."
  (interactive)
  (dolist (buffer (buffer-list))
    (kill-buffer buffer)))

(defun my/select-inside-quotes ()
  "Select text between double/single straight quotes on each side of cursor."
  (interactive)
  (let (p1 p2)
    (skip-chars-backward "^[\"']")
    (setq p1 (point))
    (skip-chars-forward "^[\"']")
    (setq p2 (point))

    (goto-char p1)
    (push-mark p2)
    (setq mark-active t)))

(defun my/select-outside-quotes ()
  "Select text between double/single straight quotes on each side of cursor."
  (interactive)
  (let (p1 p2)
    (skip-chars-backward "^[\"']")
    (setq p1 (- (point) 1))
    (skip-chars-forward "^[\"']")
    (setq p2 (+ (point) 1))

    (goto-char p1)
    (push-mark p2)
    (setq mark-active t)))

(defun my/today ()
  "Output current date."
  (interactive)
  (insert (format-time-string "%Y-%m-%d"))
  )
(global-set-key (kbd "C-c m .") 'my/today)

(defun my/js-if-region ()
  "Write if of curent region to new line."
  (interactive)
  (let (myRegion)
    (if (use-region-p)
        (setq myRegion (buffer-substring (region-beginning) (region-end)))
      (setq myRegion (thing-at-point 'word))
      )
    (end-of-line)
    (newline-and-indent)
    (insert (format "if (%s) {}" myRegion))))

(defun my/intl-region ()
  "Write if of curent region to new line."
  (interactive)
  (let (myRegion)
    (if (use-region-p)
        (setq myRegion (buffer-substring (region-beginning) (region-end)))
      (setq myRegion (thing-at-point 'word))
      )
    (kill-region (region-beginning) (region-end))
    (insert (format "{intl.formatMessage({ id: 'name', defaultMessage: '%s' })}" myRegion))))
(global-set-key (kbd "C-c m i") 'my/intl-region)

(defun my/js-console-log-region ()
  "Write console.log of curent region to new line."
  (interactive)
  (let (myRegion)
    (if (use-region-p)
        (setq myRegion (buffer-substring (region-beginning) (region-end)))
      (setq myRegion (thing-at-point 'word))
      )
    (end-of-line)
    (newline-and-indent)
    (insert (format "console.log('%s:', %s);" myRegion myRegion))))
(global-set-key (kbd "C-c m c") 'my/js-console-log-region)

(defun my/js-logger-region ()
  "Write console.log of curent region to new line."
  (interactive)
  (let (myRegion)
    (if (use-region-p)
        (setq myRegion (buffer-substring (region-beginning) (region-end)))
      (setq myRegion (thing-at-point 'word))
      )
    (end-of-line)
    (newline-and-indent)
    (insert (format "logger.info('%s:', %s);" myRegion myRegion))))
(global-set-key (kbd "C-c m l") 'my/js-logger-region)

(defun my/numberic-increase-region ()
  "Increase current region or point."
  (interactive)
  (skip-chars-backward "0-9")
  (or (looking-at "[0-9]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))
(global-set-key (kbd "M-C-]") 'my/numberic-increase-region)

(defun my/numberic-decrease-region ()
  "Increase current region or point."
  (interactive)
  (skip-chars-backward "0-9")
  (or (looking-at "[0-9]+")
      (error "No number at point"))
  (replace-match (number-to-string (1- (string-to-number (match-string 0))))))
(global-set-key (kbd "M-C-[") 'my/numberic-decrease-region)

(defun my/open-curr-dir(arg)
  "Open base dir of visited file in default external program.
When in dired mode, open file under the cursor.

With a prefix ARG always prompt for command to use."
  (interactive "P")
  (let* ((current-file-name
          (if (eq major-mode 'dired-mode)
              (dired-get-file-for-visit)
            buffer-file-name))
         (open (pcase system-type
                 (`darwin "open")
                 ((or `gnu `gnu/linux `gnu/kfreebsd) "xdg-open")))
         (program (if (or arg (not open))
                      (read-shell-command "Open current file with: ")
                    open)))
    (call-process program nil 0 nil current-file-name)))

(provide 'init-local)
;;; init-local ends here
