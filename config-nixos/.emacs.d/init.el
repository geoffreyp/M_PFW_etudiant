
(package-initialize)

(global-set-key (kbd "<f1>") 'flyspell-mode)
(global-set-key (kbd "<f2>") 'previous-buffer)
(global-set-key (kbd "<f3>") 'next-buffer)
(global-set-key (kbd "<f4>") 'previous-error)
(global-set-key (kbd "<f5>") 'next-error)
(global-set-key (kbd "<f6>") 'ecb-minor-mode)
(global-set-key (kbd "<f7>") 'compile)
(global-set-key (kbd "<f8>") 'gud-run-or-stop)
(global-set-key (kbd "<f9>") 'ggtags-find-tag-dwim)
(global-set-key (kbd "<f10>") 'ggtags-prev-mark)
(global-set-key (kbd "<f11>") 'ggtags-create-tags)

; general
; shortcuts
(define-key global-map (kbd "C-c C-c") 'comment-region)
(define-key global-map (kbd "C-c c") 'uncomment-region)
; gdb integration
(setq gdb-many-windows t)
(defvar all-gud-modes
  '(gud-mode comint-mode gdb-locals-mode gdb-frames-mode  gdb-breakpoints-mode)
  "A list of modes when using gdb")
(defun kill-all-gud-buffers ()
  "Kill all gud buffers after `q` in Debugger buffer."
  (interactive)
  (let ((count 0))
    (dolist (buffer (buffer-list))
      (with-buffer buffer
                   (when (member major-mode all-gud-modes)
                     (setq count (1+ count))
                     (kill-buffer buffer)
                     (delete-other-windows))) ;fix the remaining two windows issue
      (message "Killed %i buffer(s)." count))))
(defun gud-run-or-stop ()
  "Run or quit gdb (close ecb minor mode if opened)."
  (interactive)
  (when (bound-and-true-p ecb-minor-mode)
    (ecb-minor-mode))
  (if (bound-and-true-p gud-minor-mode)
    (kill-all-gud-buffers)
    (gdb (concat "gdb -i=mi " (read-file-name "Binary file: ")))))
; color scheme
;(add-to-list 'custom-theme-load-path "~/.emacs.d/")
(load-theme 'monokai t)
; display column 80
(require 'whitespace)
(setq whitespace-line-column 80)
(setq whitespace-style '(face lines-tail))
(global-whitespace-mode +1)
; display line number
(global-linum-mode t)
; remove start-up message
(setq inhibit-startup-message t)
; disable alarm bell
(setq ring-bell-function 'ignore)
; increase font size
(set-face-attribute 'default (selected-frame) :height 130)
; open multiple files in a single window
(add-hook 'emacs-startup-hook (lambda () (delete-other-windows)) t)
; use y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)
; prevent automatic change of default directory
(add-hook 'find-file-hook
          (lambda ()
            (setq default-directory command-line-default-directory)))
; parenthesis highlighting
(show-paren-mode 1)
; go to first error when compiling
(setq compilation-scroll-output 'first-error)

; company
(add-hook 'after-init-hook 'global-company-mode)
; ignore case
(setq company-dabbrev-downcase 0)
; speed-up display (maybe CPU-consuming)
(setq company-idle-delay 0)
; http://company-mode.github.io/

; ecb
(cond ((< emacs-major-version 25)
       (custom-set-variables '(ecb-options-version "2.40")))
      (t (custom-set-variables '(ecb-options-version "2.50"))))
(require 'ecb)
(setq ecb-tip-of-the-day nil
      ecb-layout-name "leftright2"
      ecb-layout-window-sizes nil
      ecb-compile-window-height 0.3
      ecb-layout-window-sizes (quote (("leftright2"
                                       (ecb-directories-buffer-name 0.1 . 0.4)
                                       (ecb-history-buffer-name 0.2 . 0.4)))))
; ggtags
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode) (ggtags-mode 1))))
; set backend to ctags
(setenv "GTAGSLABEL" "ctags")

; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

; avy
(global-set-key (kbd "M-g w") 'avy-goto-word-1)

(require 'haskell-mode)
(require 'markdown-mode)
(require 'julia-mode)

(require 'elpy)
(elpy-enable)


