;;; init-lsp.el --- Working with lsps -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'lsp-mode)
(require-package 'lsp-ui)
(require-package 'company-lsp)

(add-hook 'js2-mode-hook #'lsp)

(provide 'init-lsp)
;;; init-lsp.el ends here
