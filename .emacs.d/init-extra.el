
;; text-mode
(add-hook 'text-mode-hook 'flyspell-mode)

;; markdown-mode [elpa]
(add-hook 'markdown-mode-hook 'flyspell-mode)
(setq markdown-command "pandoc")
(setq markdown-enable-math t)
(add-to-list 'auto-mode-alist '("\\.md.txt$" . markdown-mode))
;; fix custom keybinding
(eval-after-load 'markdown-mode
  '(define-key markdown-mode-map
     (kbd "M-n") (lambda () (interactive) (scroll-up 1))))
(eval-after-load 'markdown-mode
  '(define-key markdown-mode-map
     (kbd "M-<down>") (lambda () (interactive) (scroll-up 4))))
(eval-after-load 'markdown-mode
  '(define-key markdown-mode-map
     (kbd "M-p") (lambda () (interactive) (scroll-down 1))))
(eval-after-load 'markdown-mode
  '(define-key markdown-mode-map
     (kbd "M-<up>") (lambda () (interactive) (scroll-down 4))))

;; web-mode [elpa]
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-enable-current-column-highlight t)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; emmet-mode [elpa]
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)

;; coffee-mode [elpa]
(setq coffee-tab-width 2)
(add-hook 'coffee-mode-hook 'coffee-cos-mode) ; compile on save

;; less-css-mode [elpa]
(setq less-css-compile-at-save t) ; compile on save

;; haskell-mode [elpa]
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; clang-format [arch:clang]
(load "/usr/share/clang/clang-format.el")
(global-set-key (kbd "C-` TAB") 'clang-format-region)

;; maxima-mode [arch:maxima]
(autoload 'maxima-mode "maxima" "Maxima mode" t)
(autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
(autoload 'maxima "maxima" "Maxima interaction" t)
(autoload 'imath-mode "imath" "Imath mode for math formula input" t)
(setq imaxima-use-maxima-mode-flag t)
(add-to-list 'auto-mode-alist '("\\.ma[cx]$" . maxima-mode))

;; agda2 [arch:agda]
(setq load-path (cons "/usr/share/agda/emacs-mode/" load-path))
(require 'agda2)

;; coq-mode [aur:coq]
;; <https://coq.inria.fr/refman/Reference-Manual017.html#Emacs>
(autoload 'coq-mode "gallina" "Major mode for editing Coq vernacular" t)
(add-to-list 'auto-mode-alist '("\\.v$" . coq-mode))

;; twelf-mode [aur:twelf]
(setq twelf-root "/opt/twelf/")
(load (concat twelf-root "emacs/twelf-init.el"))

;; mozart/oz [aur:mozart2]
(setq load-path (cons "/usr/share/mozart/elisp/" load-path))
(require 'oz)
