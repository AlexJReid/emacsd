;;;;
;; Clojure
;;;;

(add-hook 'clojure-mode-hook 'enable-paredit-mode)

(add-hook 'clojure-mode-hook 'subword-mode)

(require 'clojure-mode-extra-font-locking)
(setq clojure-align-forms-automatically t)

;; syntax hilighting for midje
(add-hook 'clojure-mode-hook
          (lambda ()
            (setq inferior-lisp-program "lein repl")
            (font-lock-add-keywords
             nil
             '(("(\\(facts?\\)"
                (1 font-lock-keyword-face))
               ("(\\(background?\\)"
                (1 font-lock-keyword-face))))
            (define-clojure-indent (fact 1))
            (define-clojure-indent (facts 1))
            (put-clojure-indent 'let 1)
            (require 'flycheck-clj-kondo)
            (flycheck-mode)
            (rainbow-delimiters-mode)))

;;;;
;; Cider
;;;;

;; provides minibuffer documentation for the code you're typing into the repl
(add-hook 'cider-mode-hook 'eldoc-mode)

;; go right to the REPL buffer when it's finished connecting
(setq cider-repl-pop-to-buffer-on-connect -1)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer -1)

;; Where to store the cider history.
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history.
(setq cider-repl-wrap-history t)

(add-hook 'cider-repl-mode-hook 'paredit-mode)

(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojurescript-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))

(defun cider-refresh ()
  (interactive)
  (cider-interactive-eval (format "(dev/reset)")))

(defun cider-user-ns ()
  (interactive)
  (cider-repl-set-ns "user"))

(eval-after-load 'cider
  '(progn
     (define-key clojure-mode-map (kbd "C-M-r") 'cider-refresh)
     (define-key clojure-mode-map (kbd "C-c u") 'cider-user-ns)
     (define-key cider-mode-map (kbd "C-c u") 'cider-user-ns)))
