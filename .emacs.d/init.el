;; require or autoload paredit-mode
;;(add-hook 'clojure-mode-hook #'paredit-mode)

(setq package-archives '(("MELPA" . "https://stable.melpa.org/packages/")
			 ("ELPA"  . "http://elpa.gnu.org/packages/")))

;;(setq package-enable-at-startup nil)
(package-initialize)

;;(load-theme 'alect-dark t)
;;(load-theme 'tango-dark t)
;;(load-theme 'misterioso t)
;;(load-theme 'wombat t)
(load-theme 'material t)


;;(global-linum-mode)

;; voeg M-` toe als save-and-kill
(defun save-and-kill () "Bewaar en kill buffer" (interactive)
       (save-buffer) (kill-buffer (current-buffer)))

;; eigen keybindings
(global-set-key [f12] 'save-and-kill)
(global-set-key "\M-o" 'goto-line)
; (global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\M-_" 'shrink-window)
(global-set-key "\M-+" 'enlarge-window)

(elpy-enable)
;; see http://elpy.readthedocs.io/en/latest/ide.html#interpreter-setup
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt")
;; see https://realpython.com/blog/python/emacs-the-best-python-editor/
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-safe-themes
   (quote
	("7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" default)))
 '(dired-dwim-target t)
 '(dired-use-ls-dired t)
 '(flycheck-flake8-maximum-line-length 120)
 '(elpy-test-runner (quote elpy-test-pytest-runner))
 '(indent-tabs-mode nil)
 '(pop-up-windows nil)
 '(column-number-mode t)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(package-selected-packages
   (quote
	(py-autopep8 flycheck elpy material-theme yaml-mode paredit go-mode erlang auto-complete)))
 '(tab-width 8)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
