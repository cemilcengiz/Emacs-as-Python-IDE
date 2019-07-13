;; INSTALL PACKAGES
;; --------------------------------------
(require 'package)

;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/"))


(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    ;ein
    elpy
    flycheck
    material-theme
    py-autopep8))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;;
(setq inhibit-startup-message t) ;; hide the startup message
(require 'better-defaults)
(advice-add 'python-mode :before 'elpy-enable)
(elpy-enable)
;; jedi backend for elpy. Apparently, jedi has larger coverage than rope.
 (setq elpy-rpc-backend "jedi")  
;; Fixing a key binding bug in elpy
;; (define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
;; Fixing another key binding bug in iedit mode
(require 'iedit)
(define-key global-map (kbd "C-c o") 'iedit-mode)


;; Activate flycheck instead flymake.
;; Do not use it since it makes editing too slow.
;; (when (require 'flycheck nil t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))


(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; Need to type "M-x run-python" to get the interactive kernel working
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")


;;emacs backup and autosave settings
(defvar --backup-directory (concat user-emacs-directory "backups"))
(if (not (file-exists-p --backup-directory))
        (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )
;end


(setq inferior-julia-program-name "/scratch/kuacc/apps/julia/0.6.2/bin/julia")
(add-to-list 'load-path "/scratch/users/ccengiz17/ESS/lisp/")
;emacs ess julia shell
;(require 'ess-site)
;emacs julia mode
;(require 'julia-mode)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("a25627a1683c391fca4fd270a7488076d298e5da4eb2df542d1772d6de5b93b0" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;
;;Linum Mode
;(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook '(lambda () (nlinum-mode t)))


;;
;; C set tab offset to 4
(setq-default c-basic-offset 4)

;;
;; set preprocessor directive offset to 0
(c-set-offset (quote cpp-macro) 0 nil)


;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
