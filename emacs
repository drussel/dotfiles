(load "~/Library/Preferences/Aquamacs Emacs/Preferences.el")
(load "~/Library/Preferences/Aquamacs Emacs/customizations.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-output-view-style (quote (("^dvi$" "^xdvi$" "open-x11 %(o?)xdvi %dS %d") ("^dvi$" "^TeXniscope$" "open -a TeXniscope.app %o") ("^pdf$" "." "open -a /Applications/TeXniscope.app %o") ("^html?$" "." "open %o"))))
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-customization-version-id 210 t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(default-frame-alist (quote ((cursor-type . box) (vertical-scroll-bars . right) (internal-border-width . 0) (modeline . t) (fringe) (background-mode . light) (menu-bar-lines . 1) (right-fringe . 11) (left-fringe . 3) (border-color . "black") (cursor-color . "Red") (mouse-color . "black") (background-color . "White") (foreground-color . "Black") (font . "-apple-andale mono-medium-r-normal--12-120-72-72-m-120-iso10646-1"))))
 '(global-linum-mode t)
 '(ns-tool-bar-display-mode nil t)
 '(ns-tool-bar-size-mode nil t)
 '(tool-bar-mode nil)
 '(toolbar-menu-show--customize t)
 '(visual-line-mode nil t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 90 :width normal))))
 '(autoface-default ((t (:inherit default :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :family "apple-andale mono"))))
 '(c++-mode-default ((t (:inherit autoface-default))) t)
 '(compilation-mode-default ((t (:inherit autoface-default))) t)
 '(completion-list-mode-default ((t (:inherit autoface-default))) t)
 '(help-mode-default ((t (:inherit autoface-default))) t)
 '(python-mode-default ((t (:inherit autoface-default))) t))
