(setq package-archives '(("MELPA" . "https://melpa.org/packages/")
			 ("ELPA"  . "https://elpa.gnu.org/packages/")))

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
(defun kill-sure () "kill buffer" (interactive)
       (kill-buffer))

(defun insert-current-date () (interactive)
       (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d)")))

;; eigen keybindings
(global-set-key [f12] 'save-and-kill)
(global-set-key (kbd "S-<f12>") 'kill-sure)
; (global-set-key "\M-o" 'goto-line) ;; just use M-g g instead
; (global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\M-_" 'shrink-window)
(global-set-key "\M-+" 'enlarge-window)

(elpy-enable)
;; see http://elpy.readthedocs.io/en/latest/ide.html#interpreter-setup
;(setq python-shell-interpreter "jupyter"
;      python-shell-interpreter-args "console --simple-prompt")
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
;; see https://realpython.com/blog/python/emacs-the-best-python-editor/
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


;; helm
(require 'helm)
(require 'helm-config)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))


(add-hook 'helm-minibuffer-set-up-hook
          'spacemacs//helm-hide-minibuffer-maybe)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)
(helm-mode 1)

;; rtags
;; https://vxlabs.com/2016/04/11/step-by-step-guide-to-c-navigation-and-completion-with-emacs-and-the-clang-based-rtags/
(defun setup-flycheck-rtags ()
  (interactive)
  (flycheck-select-checker 'rtags)
  ;; RTags creates more accurate overlays.
  (setq-local flycheck-highlighting-mode nil)
  (setq-local flycheck-check-syntax-automatically nil))

(require 'rtags)
(setq rtags-display-result-backend 'helm)
(require 'company)
(define-key c-mode-base-map (kbd "M-.")
  (function rtags-find-symbol-at-point))
(define-key c-mode-base-map (kbd "M-,")
  (function rtags-find-references-at-point))
;; install standard rtags keybindings. Do M-. on the symbol below to
;; jump to definition and see the keybindings.
(rtags-enable-standard-keybindings)
;; comment this out if you don't have or don't use helm
(setq rtags-use-helm t)
;; company completion setup
(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)
(setq rtags-completions-enabled t)
(push 'company-rtags company-backends)
(global-company-mode)
(define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))
;; use rtags flycheck mode -- clang warnings shown inline
(require 'flycheck-rtags)
;; c-mode-common-hook is also called by c++-mode
(add-hook 'c-mode-common-hook #'setup-flycheck-rtags)


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
 '(elpy-test-runner (quote elpy-test-pytest-runner))
 '(flycheck-flake8-maximum-line-length 120)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(package-selected-packages
   (quote
    (flycheck-rtags company-rtags helm-rtags helm dired-du py-autopep8 flycheck elpy material-theme yaml-mode paredit go-mode erlang auto-complete)))
 '(pop-up-windows nil)
 '(tab-width 8)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
