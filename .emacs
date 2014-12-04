(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(setenv "PYTHONPATH" "/home/viellieb/pylib")
(require 'color-theme)
;(add-to-list 'gnus-secondary-select-methods '(nnimap "uibk"
;                                  (nnimap-address "mail1.uibk.ac.at")
;                                  (nnimap-server-port 143)
;                                  (nnimap-stream ssl)))
;; Set C-z undo
(global-unset-key "\C-z") (global-set-key "\C-z" 'advertised-undo)
(global-set-key (kbd "\C-b") 'comment-region)
(global-set-key (kbd "s-z") 'company-complete)

(eval-after-load "elpy"
  '(cl-dolist (key '("C-<up>" "C-<down>" "C-<left>" "C-<right>"))
     (define-key elpy-mode-map (kbd key) nil)))

(load "auctex.el" nil t t)

;; uniquify for the multiple __init__ files
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified

(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers (or Gnus mail buffers)

(autoload 'matlab-mode "matlab" "Enter Matlab mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "matlab" "Interactive Matlab mode." t)
(eval-after-load "matlab"
  (progn
    (setq matlab-indent-function t) ; if you want function bodies indented
    (setq matlab-verify-on-save-flag nil) ; turn off auto-verify on save
    (defun my-matlab-mode-hook ()
      (setq fill-column 100))            ; where auto-fill should wrap
    (add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
    (defun my-matlab-shell-mode-hook ()
      '())
    (add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)))

(add-hook 'matlab-mode-hook
          (lambda ()
            (set (make-local-variable 'outline-regexp) "function")
            (outline-minor-mode 1)))


(autoload 'doc-mode "doc-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.adoc$" . doc-mode))
(add-hook 'doc-mode-hook
	  '(lambda ()
	     (turn-on-auto-fill)
	     (require 'asciidoc)))

;; Enable ido mode
(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have

;; switch off menu bar, scroll bar, tool bar
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; Start Winner mode:
(winner-mode t)

;; Set a few keys:
(global-set-key "\C-z" 'undo)                     ;undo
(global-set-key "\C-x\C-z" 'undo)
(global-set-key [f10] 'menu-bar-mode)                     

;; switch on font lock mode for the octave mode
(add-hook 'octave-mode-hook
	  (lambda ()
	    (abbrev-mode 1)
	    (auto-fill-mode 1)
	    (if (eq window-system 'x)
		(font-lock-mode 1))))

;; Enable desktop save mode
(desktop-save-mode 1)


;; enable flymake for python. This script assumes that the epylint script is
;; sitting inside your PATH environment
;; (when (load "flymake" t)
;;   (defun flymake-pylint-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;; 		       'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list "epylint" (list local-file))))

;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pylint-init)))

;; ;; Load ropemacs mode
;;   (defun load-ropemacs ()
;;     "Load pymacs and ropemacs"
;;     (interactive)
;;     (require 'pymacs)
;;     (pymacs-load "ropemacs" "rope-")
;;     ;; Automatically save project python buffers before refactorings
;;     (setq ropemacs-confirm-saving 'nil)
;;     (define-key ropemacs-local-keymap "\M-#" 'rope-lucky-assist)
;;   )

;; To get ropemacs working with mercurial repositories I changed the rope library at
;; http://groups.google.com/group/rope-dev/browse_thread/thread/4fa5d4865500c3e1
;;


(defun fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_FULLSCREEN" 0)))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "unknown" :family "Droid Sans Mono"))))
 '(action-lock-face ((((class color)) (:foreground "pink"))))
 '(antlr-font-lock-keyword-face ((((class color)) (:foreground "skyblue"))))
 '(antlr-font-lock-literal-face ((((class color)) (:foreground "orchid"))))
 '(antlr-font-lock-ruledef-face ((((class color)) (:foreground "gold"))))
 '(antlr-font-lock-ruleref-face ((((class color)) (:foreground "gold"))))
 '(antlr-font-lock-syntax-face ((((class color)) (:foreground "white"))))
 '(antlr-font-lock-tokendef-face ((((class color)) (:foreground "goldenrod1"))))
 '(antlr-font-lock-tokenref-face ((((class color)) (:foreground "goldenrod1"))))
 '(bhl-hr-face ((((class color)) (:foreground "goldenrod"))))
 '(bhl-mode-line-face ((((class color)) (:foreground "orchid"))))
 '(bhl-section-face ((((class color)) (:foreground "gray95"))))
 '(bhl-subsection-face ((((class color)) (:foreground "gray90"))))
 '(bhl-subsubsection-face ((((class color)) (:foreground "gray85"))))
 '(bhl-title-face ((((class color)) (:foreground "white"))))
 '(bhl-toc-face ((((class color)) (:foreground "gray70"))))
 '(bhl-tt-face ((((class color)) (:foreground "indianred2"))))
 '(bhl-url-face ((((class color)) (:foreground "gold"))))
 '(bold ((t (:foreground "green"))))
 '(bold-italic ((t (:foreground "yellow"))))
 '(cperl-array-face ((t (:foreground "orangered" :bold t))))
 '(cperl-hash-face ((t (:foreground "Red" :bold t))))
 '(cperl-nonoverridable-face ((t (:foreground "orange" :bold t))))
 '(custom-button-face ((t (:bold t :foreground "#3fdfcf"))) t)
 '(custom-group-tag ((t (:foreground "skyblue2"))))
 '(custom-group-tag-face ((t (:underline t :foreground "blue"))) t)
 '(custom-saved-face ((t (:underline t :foreground "orange"))) t)
 '(custom-state-face ((t (:foreground "green3"))) t)
 '(custom-variable-button-face ((t (:bold t :underline t :foreground "white"))) t)
 '(custom-variable-tag ((t (:foreground "skyblue2"))))
 '(custom-variable-tag-face ((t (:foreground "skyblue2"))) t)
 '(dired-face-permissions ((t (:foreground "green"))))
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-errline-face ((((class color)) (:background "black"))))
 '(flymake-warnline ((((class color)) (:underline "yellow"))))
 '(flymake-warnline-face ((((class color)) (:background "black"))))
 '(font-latex-bold-face ((((class color) (background light)) (:bold t))))
 '(font-latex-italic-face ((((class color) (background light)) (:italic t))))
 '(font-latex-math-face ((nil (:foreground "green"))))
 '(font-latex-sectioning-1-face ((((class color)) (:foreground "white"))))
 '(font-latex-sectioning-2-face ((((class color)) (:foreground "red"))))
 '(font-latex-sectioning-3-face ((((class color)) (:foreground "orange"))))
 '(font-latex-sectioning-4-face ((((class color)) (:foreground "gray85"))))
 '(font-latex-sectioning-5-face ((((class color)) (:foreground "gray85"))))
 '(font-latex-sedate-face ((((class color) (background light)) (:foreground "gold"))))
 '(font-latex-warning-face ((((class color)) (:inherit (quote font-lock-warning-face)))))
 '(font-lock-comment-face ((t (:foreground "orange3"))))
 '(font-lock-constant-face ((((class color)) (:foreground "orchid"))))
 '(font-lock-doc-face ((((class color)) (:foreground "coral2"))))
 '(font-lock-doc-string-face ((t (:foreground "Wheat3"))))
 '(font-lock-end-statement ((((class color)) (:foreground "gray60"))))
 '(font-lock-function-name-face ((t (:foreground "skyblue" :bold t))))
 '(font-lock-keyword-face ((t (:foreground "gold"))))
 '(font-lock-literal-face ((((class color)) (:foreground "orchid"))))
 '(font-lock-namespace-face ((((class color)) (:foreground "steelblue1"))))
 '(font-lock-operator-face ((((class color)) (:foreground "gray95"))))
 '(font-lock-parenthesis-face ((((class color)) (:foreground "gray60"))))
 '(font-lock-preprocessor-face ((t (:foreground "red" :bold t))))
 '(font-lock-reference-face ((t (:foreground "orangered"))))
 '(font-lock-string-face ((t (:foreground "green3"))))
 '(font-lock-type-face ((t (:foreground "#886fff" :bold t))))
 '(font-lock-variable-name-face ((t (:foreground "yellow" :bold t))))
 '(font-lock-warning-face ((t (:foreground "Violetred" :bold t))))
 '(highlight ((t (:foreground "red3" :background "white"))))
 '(howm-menu-key-face ((((class color)) (:foreground "orange"))))
 '(howm-menu-list-face ((((class color)) (:foreground "white"))))
 '(howm-mode-keyword-face ((((class color)) (:foreground "green"))))
 '(howm-mode-ref-face ((((class color)) (:foreground "skyblue2"))))
 '(howm-mode-title-face ((((class color)) (:foreground "gold"))))
 '(howm-mode-wiki-face ((((class color)) (:foreground "coral"))))
 '(howm-reminder-deadline-face ((((class color)) (:foreground "pink"))))
 '(howm-reminder-defer-face ((((class color)) (:foreground "pink"))))
 '(howm-reminder-done-face ((((class color)) (:foreground "pink"))))
 '(howm-reminder-normal-face ((((class color)) (:foreground "pink"))))
 '(howm-reminder-schedule-face ((((class color)) (:foreground "pink"))))
 '(howm-reminder-today-face ((((class color)) (:foreground "pink"))))
 '(howm-reminder-todo-face ((((class color)) (:foreground "pink"))))
 '(howm-reminder-tomorrow-face ((((class color)) (:foreground "pink"))))
 '(howm-view-hilit-face ((((class color)) (:foreground "gold"))))
 '(isearch ((t (:foreground "red" :background "white"))))
 '(italic ((t (:foreground "yellowgreen"))))
 '(list-mode-item-selected ((t (:foreground "green"))) t)
 '(makefile-shell-face ((((class color)) (:foreground "white"))))
 '(message-cited-text ((t (:bold t :italic nil))))
 '(message-header-name ((t (:foreground "gray70"))))
 '(message-header-other ((t (:foreground "gray90"))))
 '(message-separator ((t (:foreground "white"))))
 '(minibuffer-prompt ((t (:foreground "skyblue2"))))
 '(mode-line ((t (:background "gray21" :foreground "gray80" :box nil))))
 '(nxml-comment-content-face ((((class color)) (:foreground "gray70"))))
 '(nxml-delimited-data-face ((((class color)) (:foreground "coral"))))
 '(nxml-delimiter-face ((((class color)) (:foreground "gold"))))
 '(nxml-name-face ((((class color)) (:foreground "cornflowerblue"))))
 '(paren-face ((((class color)) (:foreground "gray60"))))
 '(region ((t (:background "navy"))))
 '(secondary-selection ((t (:foreground "white" :background "red"))))
 '(slime-display-edit-face ((((class color)) nil)))
 '(slime-display-highlight-face ((((class color)) (:foreground "yellowgreen"))))
 '(text-cursor ((t (:foreground "black" :background "green"))) t)
 '(widget-field ((t (:background "Wheat" :foreground "gray2"))))
 '(widget-single-line-field ((t (:background "Wheat" :foreground "gray2"))))
 '(zmacs-region ((t (:background "RoyalBlue"))) t))



;; Missing stuff.
;; ropemode ??
;; Latex stuff
;; qfp sequence file mode
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(TeX-view-predicate-list nil)
 '(TeX-view-program-list (quote (("evince" "evince"))))
 '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-pdf "Evince") (output-html "xdg-open")))))

;;Highlight parentheses mode - Will save your life in Latex
(require 'highlight-parentheses)

(defun word-count nil "Count words in buffer" (interactive)
(shell-command-on-region (point-min) (point-max) "wc -w"))

(package-initialize)
(elpy-use-ipython)
(elpy-enable)


(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
