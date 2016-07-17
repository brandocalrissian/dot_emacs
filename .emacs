(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-insert-mode t nil (autoinsert))
 '(compilation-window-height 12)
 '(delete-selection-mode nil nil (delsel))
 '(font-lock-maximum-decoration t)
 '(global-font-lock-mode t nil (font-lock))
 '(hscroll-step 10)
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(next-line-add-newlines nil)
 '(scroll-bar-mode (quote right))
 '(tab-width 2)
 '(vc-delete-logbuf-window nil))
; end of customize...

; removing dependencies on .Xresources for benjy's machine
(set-foreground-color "cornsilk")
(set-background-color "black")
(set-cursor-color "cornsilk")
(set-border-color "cornsilk")
(setq default "-*-courier-medium-r-*-*-12-*-*-*-*-*-*-*")
(set-default-font default)
(setq bold "-*-courier-bold-r-*-*-12-*-*-*-*-*-*-*")
(set-face-font 'bold bold)
(set-face-font 'bold-italic bold)
(set-face-font 'font-lock-keyword-face bold)

;; spaces over tabs.
(setq-default indent-tabs-mode nil)

(c-add-style 
"kirby" 
 '((c-basic-offset . 2)
   (c-comment-only-line-offset . (0 . 0))
   (c-offsets-alist . ((inline-open . 0)
		       (topmost-intro-cont    . +)
		       (statement-block-intro . +)
		       (knr-argdecl-intro . 5)
		       (substatement-open . +)
		       (label . 0)
		       (statement-case-open . +)
		       (statement-cont . +)
		       (arglist-intro . c-lineup-arglist-intro-after-paren)
		       (arglist-close . c-lineup-arglist)
		       (access-label . 0)
		       (inher-cont     . c-lineup-java-inher)
		       (func-decl-cont . c-lineup-java-throws)))
   (c-special-indent-hook . c-gnu-impose-minimum)
   (c-comment-continuation-stars . "* ")
   (c-hanging-comment-ender-p . nil)
   (c-hanging-comment-starter-p . nil))
 )

;; straight from our friendly emacs help
;; Type FIXME: in a comment and it gets highlighted.
;; Cute, huh?
(font-lock-add-keywords 'c-mode
  '(("\\<\\(FIXME\\):" 1 font-lock-warning-face prepend)))
(font-lock-add-keywords 'cc-mode
  '(("\\<\\(FIXME\\):" 1 font-lock-warning-face prepend)))
(font-lock-add-keywords 'java-mode
  '(("\\<\\(FIXME\\):" 1 font-lock-warning-face prepend)))
;; I liked it so much i bought the company
(font-lock-add-keywords 'java-mode
  '(("\\<\\(FIXME\\):" 1 font-lock-warning-face prepend)))


;; for new psgml mode for sgml and xml docs
(autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
(autoload 'xml-mode "psgml" "Major mode to edit XML files." t)

(require 'web-mode)

;; to map some more common file extensions to html mode
(setq auto-mode-alist
      (append '(("\\.html$" . web-mode)
                ("\\.htm$"  . web-mode)
                ("\\.HTM$"  . web-mode)
                ("\\.jsp$"  . web-mode)
                ("\\.JSP$"  . web-mode)
                ("\\.jsx$"  . web-mode)
                ("\\.css$"  . web-mode)
                ("\\.scss$"  . web-mode)
                ("\\.js$"   . js2-mode)
                ("\\.json$"   . web-mode)
                ) auto-mode-alist))

(defun override-js2-keys()
  "stop some things I hate"
  (interactive)
  (local-unset-key "\M-j"))

(add-hook 'js2-mode-hook 'override-js2-keys)

;;change the compile command for java-mode
(add-hook 'java-mode-hook
	  (function
       (lambda ()
				 (c-set-style "kirby"))))

;; change annoying scrolling pattern where emacs would move the cursor and
;; then center it annoyingly-- not what I wanted.
(setq scroll-step 2)

;; change annoying truncation of lines
(setq truncate-partial-width-windows nil)

;; quiet, please.
(setq ring-bell-function (lambda nil))

(setq c++-mode-hook 'turn-on-auto-fill)
(setq c-mode-hook 'turn-on-auto-fill)

(add-hook 'java-mode-hook
	  (function
	   (lambda ()
	     (auto-fill-mode 1))))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
)

(add-hook 'web-mode-hook  'my-web-mode-hook)

(setq text-mode-hook 'turn-on-auto-fill)
(setq VC-Log-mode-hook 'turn-on-auto-fill)

(setq default-major-mode 'text-mode)    ;some hooks...
(setq auto-save-interval 100)           ;save this often

;; blow off the horrible startup message
(setq inhibit-startup-message t)

;; lose menu bar
(menu-bar-mode 0)

;; lose tool bar
(tool-bar-mode 0)

;; column number mode
(column-number-mode t)

;; see marked regions with highlighting
(transient-mark-mode t)

;; key bindings
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-cl" 'what-line)
(global-set-key "\C-cr" 'replace-string)
(global-set-key "\C-cq" 'query-replace)
(global-set-key "\C-u" 'scroll-down)
(global-set-key "\C-cu" 'beginning-of-buffer)
(global-set-key "\C-cv" 'end-of-buffer)
(global-set-key "\M-\C-h" 'backward-kill-word)
(global-set-key "\C-c\C-r" 'comment-region)
(global-set-key "\C-c\C-c" 'compile)

;; remove annoying window iconification...
(global-set-key "\C-z" nil) 

;; the alt-escape is incorrect. Don't know how to fix it right now.
(global-set-key "\M-h" 'backward-char)	;left
(global-set-key "\M-j" 'next-line) ; down
(global-set-key "\M-k" 'previous-line) ; up
(global-set-key "\M-l" 'forward-char) ; right

; ;; for vi-like, well, not really, controls
;(global-set-key [M-S-j] 'jump-forward-lines) ; down
;(global-set-key [M-S-k] 'jump-back-lines) ; up
(global-set-key "\M-b" 'backward-word) ; left
(global-set-key "\M-w" 'forward-word) ; down


;; Reasonable f-key bindings
(global-set-key [f21] 'scroll-down-in-place)    ; R1
(global-set-key [f22] 'next-error)              ; R2
(global-set-key [f23] 'enlarge-window)          ; R3
(global-set-key [f24] 'scroll-up-in-place)      ; R4
(global-set-key [f25] 'goto-line)               ; R5
(global-set-key [f26] 'shrink-window)           ; R6
(global-set-key [f27] 'beginning-of-buffer)     ; R7
(global-set-key [f29] 'scroll-down)             ; R9
(global-set-key [f31] 'recenter)
(global-set-key [M-left] 'backward-word)
(global-set-key [M-right] 'forward-word)
(global-set-key [f33] 'end-of-buffer)           ; R13
(global-set-key [f35] 'scroll-up)               ; R15
(global-set-key [break] 'shrink-window)
(global-set-key [cancel] 'start-kbd-macro)
(global-set-key [menu] 'scroll-up-in-place)
(global-set-key [system] 'scroll-down-in-place)
(global-set-key [clearline] 'next-error)
(global-set-key [deleteline] 'start-kbd-macro)

(global-set-key [f1] 'next-error)               ; F8
(global-set-key [f2] 'compile)                  ; F5
(global-set-key [f3] 'enlarge-window)           ; F1
(global-set-key [f4] 'shrink-window)            ; F2
(global-set-key [f5] 'call-last-kbd-macro)      ; F3
(global-set-key [f6] 'goto-line)                ; F4
(global-set-key [f7] 'c++-indent-defun)         ; F7
(global-set-key [f8] 'query-replace)            ; F10
(global-set-key [f9] 'grep)                     ; F6
(global-set-key [f10] 'gdb)                     ; F9
(global-set-key [f11] 'copy-region-as-kill)     ; L6
(global-set-key [f12] 'kill-region)  ; L2, F12
(global-set-key [f13] 'electric-buffer-list)    ; L3
(global-set-key [f14] 'undo)                    ; L4
(global-set-key [f15] 'open-rectangle)          ; L5
(global-set-key [f16] 'keyboard-quit)           ; L1, F11
(global-set-key [f17] 'yank-rectangle)          ; L7
(global-set-key [f18] 'yank)                    ; L8
(global-set-key [f19] 'kill-rectangle)          ; L9
(global-set-key [f20] 'kill-region)             ; L10
(global-set-key [help] 'help-for-help)          ; help

(setq initial-major-mode 'text-mode)
(setq default-major-mode 'text-mode)
(setq default-minor-mode 'auto-fill)

;; save myself from the horror of set-fill-column...
(global-unset-key "\C-xf")

(toggle-frame-maximized)

;;benjy's delete whitespace function. --BK 11/95
(defun brandons-function ()
 " This function deletes any whitespace between the current point and
  the previous non-whitespace character."
 (interactive)
 (let ((beginning-position (point)))
   (search-backward-regexp "[^ \t\r\n]")
   (delete-region beginning-position (+ 1 (point)))
   (forward-char 1)))

(defun avoid-accidentally-killing-emacs (&optional arg)
  "So, I kept killing emacs with careless keystrokes. Asks if you're
sure before exiting the editor." 
  (interactive "P")
  (if (yes-or-no-p "Really kill the one true editor? ")
      (save-buffers-kill-emacs arg)))

(defun backward-subname ()
  "Moves the cursor to the previous capped letter (useful for moving through java variables and class names)"
  (interactive)
  (setq case-fold-search nil)
  (let ((beginning-position (point)))
   (search-backward-regexp "[A-Z]"))
  (setq case-fold-search t))

(defun forward-subname ()
  "Moves the cursor to the next capped letter (useful for moving through java variables and class names)"
  (interactive)
  (setq case-fold-search nil)
  (forward-char 1)
  (let ((beginning-position (point)))
   (search-forward-regexp "[A-Z]"))
  (backward-char 1)
  (setq case-fold-search t))

;;set the key combinations: M-S-backspace and M-S-delete...
(global-set-key (quote [M-backspace]) (quote brandons-function))
(global-set-key (quote [M-delete]) (quote brandons-function))
(global-set-key (quote [M-S-delete]) 'backward-kill-word)
(global-set-key (quote [M-S-backspace]) 'backward-kill-word)

(global-set-key "\C-x\C-c" 'avoid-accidentally-killing-emacs)
(global-set-key (quote [M-S-right]) 'forward-subname)
(global-set-key (quote [M-S-left]) 'backward-subname)
(global-set-key (quote [home]) 'beginning-of-buffer)
(global-set-key (quote [end]) 'end-of-buffer)

(defun jump-forward-lines()
  " This function will move the cursor forward some lines (currently 10)."
  (interactive)
  (forward-line 10))
(defun jump-back-lines()
  " This function will move the cursor back a few lines (currently 10)."
  (interactive)
  (forward-line -10))

(global-set-key (quote [M-down]) (quote jump-forward-lines))
(global-set-key (quote [M-up]) (quote jump-back-lines))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-builtin-face ((((class color) (background dark)) (:foreground "cadetblue"))))
 '(font-lock-comment-face ((((class color) (background dark)) (:foreground "SpringGreen"))))
 '(font-lock-function-name-face ((((class color) (background dark)) (:foreground "turquoise"))))
 '(font-lock-keyword-face ((((class color) (background dark)) (:bold t :foreground "tomato1"))))
 '(font-lock-reference-face ((((class color) (background dark)) (:foreground "yellow"))))
 '(font-lock-string-face ((((class color) (background dark)) (:foreground "steelblue1"))))
 '(font-lock-type-face ((((class color) (background dark)) (:foreground "plum"))))
 '(font-lock-variable-name-face ((((class color) (background dark)) (:foreground "orange"))))
 '(font-lock-warning-face ((((class color) (background dark)) (:bold t :foreground "Yellow")))))

