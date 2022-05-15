;;;;
;; alexjreid, mostly borrowed
;;;;

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(
    paredit
    clojure-mode
    clojure-mode-extra-font-locking
    cider
    ido-completing-read+
    smex
    projectile
    rainbow-delimiters
    tagedit
    magit
    yaml-mode
    json-mode
    tagedit
    markdown-mode
    go-mode))

(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/custom")

(load "ui.el")
(load "clojure.el")
(load "editing.el")
(load "navigation.el")
(load "misc.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(projectile exec-path-from-shell tagedit smex rainbow-delimiters paredit magit ido-completing-read+ clojure-mode-extra-font-locking cider)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
