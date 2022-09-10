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
    ;clojure-mode
    clojure-mode-extra-font-locking
    cider
    aggressive-indent
    ido-completing-read+
    smex
    paredit
    projectile
    rainbow-delimiters
    tagedit
    magit
    yaml-mode
    json-mode
    tagedit
    flycheck-clj-kondo
    markdown-mode
    go-mode))

(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/custom")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(package-selected-packages
 ;;  '(ac-cider clojure-mode dired-sidebar cider-hydra projectile exec-path-from-shell tagedit smex rainbow-delimiters paredit magit ido-completing-read+ clojure-mode-extra-font-locking cider))
 '(safe-local-variable-values
   '((cider-shadow-watched-builds "script")
     (cider-shadow-default-options . "script")
     (cider-shadow-watched-builds "test")
     (cider-shadow-default-options . "test")
     (cider-clojure-cli-global-options . "-A:dev")
     (cider-ns-refresh-after-fn . "integrant.repl/resume")
     (cider-ns-refresh-before-fn . "integrant.repl/suspend")
     (cider-shadow-watched-builds "app")
     (cider-shadow-default-options . "app")
     (cider-default-cljs-repl . shadow)))
 '(tool-bar-mode nil)
 '(warning-suppress-log-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 100 :width normal)))))

(load "ui.el")
(load "clojure.el")
(load "editing.el")
(load "navigation.el")
(load "misc.el")
