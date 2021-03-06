(require-package 'helm)
(require-package 'helm-gtags)

(use-package helm
  :ensure t
  :init
  (helm-mode 1)
  :bind (("C-c h" . 'helm-command-prefix)
	 ("C-s" . 'helm-occur)
	 ("M-s f" . 'helm-imenu-anywhere)
	 ("M-s g" . 'helm-imenu-in-all-buffers)
	 ("M-x" . #'helm-M-x)
	 ("C-x r b" . #'helm-filtered-bookmarks)
	 ("C-x C-f" . 'helm-find-files))
  :bind (:map helm-map
	 ("<tab>" . 'helm-execute-persistent-action) ; rebind tab to run persistent action
	 ("C-i" . 'helm-execute-persistent-action) ; make TAB work in terminal
	 ("C-z" . 'helm-select-action)) ; list actions using C-z
  :config
  (require 'helm-config)
  (helm-gtags-mode t)
  (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

  )

;; ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
;; (global-set-key (kbd "C-c h") 'helm-command-prefix)
;; (global-unset-key (kbd "C-x c"))
;; (global-set-key (kbd "C-s") 'helm-occur)
;; (global-set-key (kbd "M-s f") 'helm-imenu-anywhere)
;; (global-set-key (kbd "M-s g") 'helm-imenu-in-all-buffers)
;; (global-set-key (kbd "M-x") #'helm-M-x)
;; (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)

;; (when (executable-find "curl")
;;   (setq helm-google-suggest-use-curl-p t))

;; (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
;;       helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
;;       helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
;;       helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
;;       helm-ff-file-name-history-use-recentf t
;;       helm-echo-input-in-header-line t)

;; (defun spacemacs//helm-hide-minibuffer-maybe ()
;;   "Hide minibuffer in Helm session if we use the header line as input field."
;;   (when (with-helm-buffer helm-echo-input-in-header-line)
;;     (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
;;       (overlay-put ov 'window (selected-window))
;;       (overlay-put ov 'face
;;                    (let ((bg-color (face-background 'default nil)))
;;                      `(:background ,bg-color :foreground ,bg-color)))
;;       (setq-local cursor-type nil))))


;; (add-hook 'helm-minibuffer-set-up-hook
;;           'spacemacs//helm-hide-minibuffer-maybe)

;; (setq helm-autoresize-max-height 0)
;; (setq helm-autoresize-min-height 20)
;; (setq helm-autoresize-mode 1)

;; (helm-mode 1)

;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
;; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
;; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(provide 'init-helm)
