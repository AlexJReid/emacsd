(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(menu-bar-mode (eq system-type 'darwin))
(tool-bar-mode -1)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
(load-theme 'tomorrow-night-bright t)

(setq inhibit-startup-screen t)
(fset 'yes-or-no-p 'y-or-n-p)