(setq package-archives '(("MELPA" . "https://melpa.org/packages/")
                         ("ELPA"  . "https://elpa.gnu.org/packages/")))

(package-initialize)
(load-theme 'wombat t)

(defun save-and-kill () "Bewaar en kill buffer" (interactive)
       (save-buffer) (kill-buffer (current-buffer)))

(defun save-copy (fname) "save current buffer as copy in other file" (interactive "F")
       (write-region (point-min) (point-max) fname))

(defun insert-current-date () (interactive)
       (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d)")))

;; eigen keybindings
(global-set-key [f12] 'save-and-kill)
(global-set-key "\M-_" 'shrink-window)
(global-set-key "\M-+" 'enlarge-window)
(global-set-key [?\C-\M-=] 'ff-find-other-file)

(elpy-enable)
;; see http://elpy.readthedocs.io/en/latest/ide.html#interpreter-setup
;;(setq python-shell-interpreter "jupyter"
;;      python-shell-interpreter-args "console --simple-prompt")
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
;;(setq python-shell-interpreter "python"
;;      python-shell-interpreter-args "-i")

;; see https://realpython.com/blog/python/emacs-the-best-python-editor/
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; https://tuhdo.github.io/c-ide.html
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

(setq split-height-threshold 0)
(setq split-width-threshold 0)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" default)))
 '(dired-dwim-target t)
 '(dired-use-ls-dired t)
 '(elpy-test-pytest-runner-command (quote ("py.test" "-s")))
 '(elpy-test-runner (quote elpy-test-pytest-runner))
 '(flycheck-flake8-maximum-line-length 80)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(package-selected-packages
   (quote
    (groovy-mode markdown-mode blacken flycheck-rtags company-rtags helm-rtags helm dired-du py-autopep8 flycheck elpy material-theme yaml-mode paredit go-mode erlang auto-complete)))
 '(pop-up-windows nil)
 '(tab-width 8)
 '(tool-bar-mode nil)
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "1ASC" :family "Liberation Mono")))))
