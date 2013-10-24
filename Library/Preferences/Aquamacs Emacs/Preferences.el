;; .EMACS

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
;(setq frame-title-format
;      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)


;(server-start)
;(load (expand-file-name
;	   "/Applications/TeXniscope.app/Contents/Resources/txs-search.el"))

;(add-hook 'LaTeX-mode-hook (lambda () (local-set-key "\C-c\C-j"
;									   'txs-jump-to-line)))
(setq c-offset-alist (append '((innamespace . 0)
			       (namespace-close . 0)
			       (namespace-open . 0))))



(global-set-key [f1] 'revert-buffer)
(global-set-key [f2] 'goto-line)
(global-set-key "\M-r" 'query-replace-regexp)
(global-set-key [f7] 'compile)
(global-set-key [f6] 'gud-gdb)

(setq compile-command "ninja -j 4")

(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checking" t)

(add-hook 'latex-mode-hook
           '(lambda ()
	      (load flyspell-mode)
	      (flyspell-mode)
	      (flyspell-buffer)))

(add-hook 'reftex-mode-hook
           '(lambda ()
	      (flyspell-mode)
	      (flyspell-buffer)))

(fset 'collapse-brackets
    [?\M-x ?q ?u ?e ?\C-i ?- ?r ?e ?g ?\C-i ?\C-m ?< ?[ ?^ ?> ?< ?] ?* ?> ?\C-m ?\C-m ?! S-home])


(global-set-key "\C-b" 'collapse-brackets)

(setq auto-mode-alist (append '(
                                ("\\.h$"  . c++-mode)
                                ("\\.hpp$"  . c++-mode)
                ) auto-mode-alist))
(setq-default indent-tabs-mode nil)

(setq auto-mode-alist
      (cons '("SConstruct" . python-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("SConscript" . python-mode) auto-mode-alist))

(delete-selection-mode 1)
(global-visual-line-mode 1)
(global-linum-mode 1)
;(defvar user-temporary-file-directory
;  (concat temporary-file-directory user-login-name "/"))
;(make-directory user-temporary-file-directory t)
;(setq backup-by-copying t)
;(setq backup-directory-alist
;      `(("." . ,user-temporary-file-directory)
;        (,tramp-file-name-regexp nil)))
;(setq auto-save-list-file-prefix
;      (concat user-temporary-file-directory ".auto-saves-"))
;(setq auto-save-file-name-transforms
;      `((".*" ,user-temporary-file-directory t)))

;(require 'auto-save)
;(require 'backup-dir)

;(defvar user-temporary-file-directory
;  (concat (temp-directory) "/" (user-login-name)))
;(make-directory user-temporary-file-directory t)
;(setq backup-by-copying t)
;(setq auto-save-directory user-temporary-file-directory)
;(setq auto-save-list-file-prefix
;         (concat user-temporary-file-directory ".auto-saves-"))
;(setq bkup-backup-directory-info
;      `((t ,user-temporary-file-directory full-path)))

;(load-file "~/emacs/cedet/common/cedet.el")
;(add-to-list 'load-path "Library/Application\ Support/Aquamacs\ Emacs/JDEE/cedet/common")
;(add-to-list 'load-path "~/Library/Application\ Support/Aquamacs\ Emacs/ecb-2.32")
;(require 'cedet)
;(require 'ecb-autoloads)
;(semantic-load-enable-gaudy-code-helpers)
;(require 'semantic-gcc)
;(semantic-add-system-include "/opt/local/include" 'c++-mode)
;(semantic-add-system-include "/Users/drussel/fs/include" 'c++-mode)
;(require 'ede)
;(ede-cpp-root-project "IMP"
;                :name "IMP svn debug"
;                :file "~/src/IMP/svn/debug/SConstruct"
;                :include-path '("/build/include"
;                                "/modules"
;                               )
;                :system-include-path '("~/fs/include")
;                :spp-table '(("IMP_BEGIN_NAMESPACE" . "namespace IMP {")
;                             ("IMP_END_NAMESPACE" . "}")))


(add-hook 'c++-mode-hook
        '(lambda () (font-lock-set-up-width-warning 80)))
(add-hook 'python-mode-hook
        '(lambda () (font-lock-set-up-width-warning 80)))



(defun font-lock-width-keyword (width)
 `((,(format "^%s\\(.+\\)" (make-string width ?.))
    (1 font-lock-warning-face t))))

(font-lock-add-keywords 'c++-mode (font-lock-width-keyword 80))
(font-lock-add-keywords 'python-mode (font-lock-width-keyword 80))


(add-hook 'write-file-hooks 'delete-trailing-whitespace)

(defun delete-trailing-blank-lines ()
     "Deletes all blank lines at the end of the file."
     (interactive)
     (save-excursion
       (save-restriction
         (widen)
         (goto-char (point-max))
         (delete-blank-lines))))

(add-hook 'write-file-hooks 'delete-trailing-blank-lines)

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-filter-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(autoload 'andersl-cmake-font-lock-activate "andersl-cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'andersl-cmake-font-lock-activate)
(setq auto-mode-alist
      (cons '("CMakeLists.txt" . andersl-cmake-font-lock-activate) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.cmake$" . andersl-cmake-font-lock-activate) auto-mode-alist))

(unless window-system
  (xterm-mouse-mode 1)
  (global-set-key [mouse-4] '(lambda ()
                               (interactive)
                               (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                               (interactive)
                               (scroll-up 1))))

(load "~/src/dotfiles/lib/clang-format.el")
(global-set-key [C-M-tab] 'clang-format-region)
(add-hook 'c++-mode-hook 'my-c++-bindings)
(defun my-c++-bindings ()
  (define-key c++-mode-map [tab] 'clang-format-region))

(add-to-list 'load-path "~/src/dotfiles/lib/")
    (require 'py-autopep8)
    (add-hook 'before-save-hook 'python-fmt-before-save)