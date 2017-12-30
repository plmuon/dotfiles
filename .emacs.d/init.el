;(require 'package)
;(add-to-list 'package-archives
;			 '("melpa-stable" . "https://stable.melpa.org/packages/")
;			 )
;; require or autoload paredit-mode
;(add-hook 'clojure-mode-hook #'paredit-mode)

(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
						 ("MELPA" . "https://stable.melpa.org/packages/")
						 ("gnu"  . "http://elpa.gnu.org/packages/")
						 ("SC"   . "http://joseito.republika.pl/sunrise-commander/")))

;; installed alect-themes as elpa package, therefore:
(setq package-enable-at-startup nil)
(package-initialize)

(load-theme 'alect-dark t)
;(load-theme 'tango-dark t)
;(load-theme 'misterioso t)
;(load-theme 'wombat t)

;; voeg M-` toe als save-and-kill
(defun save-and-kill () "Bewaar en kill buffer" (interactive)
  (save-buffer) (kill-buffer (current-buffer)))

;; eigen keybindings
(global-set-key [f12] 'save-and-kill)
(global-set-key "\M-o" 'goto-line)
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\M-_" 'shrink-window)
(global-set-key "\M-+" 'enlarge-window)

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
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(tab-width 4)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

