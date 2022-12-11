(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(rust
     java
     (python :variables
             python-pipenv-activate t
             python-test-runner 'pytest
             python-sort-imports-on-save t
             python-formatter 'black
             python-backend 'lsp
             python-lsp-server 'pyright)
     go
     javascript
     yaml
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-enable-snippets-in-popup t)
     emacs-lisp
     git
     helm
     lsp
     markdown
     (version-control :variables
                      version-control-global-margin t
                      version-control-diff-tool 'git-gutter+)
     (shell :variables
            shell-default-term-shell "/bin/bash"
            shell-default-height 30
            shell-default-position 'bottom)
     (treemacs :variables
               treemacs-use-all-the-icons-theme t
               treemacs-space-between-root-nodes nil
               )
     )
   dotspacemacs-additional-packages '()
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  (setq-default
   dotspacemacs-enable-emacs-pdumper nil
   dotspacemacs-emacs-pdumper-executable-file "emacs"
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-gc-cons '(100000000 0.1)
   dotspacemacs-read-process-output-max (* 1024 1024)
   dotspacemacs-use-spacelpa nil
   dotspacemacs-verify-spacelpa-archives t
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory 'emacs-version
   dotspacemacs-editing-style 'vim
   dotspacemacs-startup-buffer-show-version t
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner-scale 'auto
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-show-startup-list-numbers t
   dotspacemacs-startup-buffer-multi-digit-delay 0.4
   dotspacemacs-startup-buffer-show-icons nil
   dotspacemacs-new-empty-buffer-major-mode 'text-mode
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-scratch-buffer-persistent nil
   dotspacemacs-scratch-buffer-unkillable nil
   dotspacemacs-initial-scratch-message nil
   dotspacemacs-themes '(atom-one-dark
                         spacemacs-light)
   dotspacemacs-mode-line-theme '(doom :separator wave :separator-scale 1.5)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 10.0
                               :weight normal
                               :width normal)
   dotspacemacs-activate-smartparens-mode t
   dotspacemacs-active-transparency 90
   dotspacemacs-auto-generate-layout-names nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-background-transparency 90
   dotspacemacs-byte-compile nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-enable-server nil
   dotspacemacs-ex-command-key ":"
   dotspacemacs-folding-method 'evil
   dotspacemacs-frame-title-format "%I@%S"
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-home-shorten-agenda-source nil
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-icon-title-format nil
   dotspacemacs-inactive-transparency 90
   dotspacemacs-large-file-size 1
   dotspacemacs-leader-key "SPC"
   dotspacemacs-line-numbers 'relative
   dotspacemacs-loading-progress-bar t
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-persistent-server nil
   dotspacemacs-pretty-docs nil
   dotspacemacs-scroll-bar-while-scrolling t
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   dotspacemacs-server-socket-dir nil
   dotspacemacs-show-trailing-whitespace t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-show-transient-state-title t
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smooth-scrolling t
   dotspacemacs-swap-number-row nil
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   dotspacemacs-undecorated-at-startup nil
   dotspacemacs-use-SPC-as-y t
   dotspacemacs-use-clean-aindent-mode t
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-whitespace-cleanup 'changed
   dotspacemacs-zone-out-when-idle nil)
)

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
)

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (setq projectile-project-search-path '(("~/repos/" . 1) ("~/repos_personal/" . 1 ) ("~/github" . 1)))
  (setq mouse-wheel-scroll-amount '(0.07))
  (setq mouse-wheel-progressive-speed nil)
  (setq ring-bell-function 'ignore)
)


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
)


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (treemacs-create-theme "Daniel"
    :icon-directory (treemacs-join-path treemacs-dir "icons/default")
    :config
    (progn
      ;; (treemacs-create-icon :file "root-open.png"   :fallback ""       :extensions (root-open))
      ;; (treemacs-create-icon :file "root-closed.png" :fallback ""       :extensions (root-closed))
      ;; (treemacs-create-icon :file "emacs.png"       :fallback "🗏 "     :extensions ("el" "elc"))
      ;; (treemacs-create-icon :file "readme.png"      :fallback "🗏 "     :extensions ("readme.md"))
      ))

  (global-set-key (kbd "C-<left> ") 'windmove-left)
  (global-set-key (kbd "C-<right> ") 'windmove-right)
  (global-set-key (kbd "C-<up> ") 'windmove-up)
  (global-set-key (kbd "C-<down> ") 'windmove-down)
  (global-set-key (kbd "C-+") 'text-scale-increase)
  (global-set-key (kbd "C--") 'text-scale-decrease)
  (spacemacs/set-leader-keys "e" 'treemacs)
  (spacemacs/set-leader-keys "q" 'kill-buffer-and-window)
  (spacemacs/set-leader-keys "a" 'avy-goto-char-timer)
  (define-key evil-normal-state-map "ä" #'forward-paragraph)
  (define-key evil-normal-state-map "ö" #'backward-paragraph)
  (treemacs-git-mode 'deferred)
)


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(nrepl-message-colors
   '("#183691" "#969896" "#a71d5d" "#969896" "#0086b3" "#795da3" "#a71d5d" "#969896"))
 '(org-fontify-done-headline nil)
 '(org-fontify-todo-headline nil)
 '(package-selected-packages
   '(helm-shell-history neotree afternoon-theme alect-themes ample-theme ample-zen-theme anti-zenburn-theme apropospriate-theme badwolf-theme birds-of-paradise-plus-theme bubbleberry-theme busybee-theme cherry-blossom-theme chocolate-theme clues-theme color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow cyberpunk-theme dakrone-theme darkmine-theme darkokai-theme darktooth-theme django-theme doom-themes dracula-theme espresso-theme exotica-theme eziam-themes farmhouse-themes flatland-theme flatui-theme gandalf-theme gotham-theme grandshell-theme gruber-darker-theme gruvbox-theme hc-zenburn-theme hemisu-theme heroku-theme inkpot-theme ir-black-theme jazz-theme jbeans-theme kaolin-themes light-soap-theme lush-theme madhat2r-theme majapahit-theme material-theme minimal-theme modus-themes moe-theme molokai-theme monochrome-theme monokai-theme mustang-theme naquadah-theme noctilux-theme obsidian-theme occidental-theme oldlace-theme omtose-phellack-theme organic-green-theme phoenix-dark-mono-theme phoenix-dark-pink-theme planet-theme professional-theme purple-haze-theme railscasts-theme rebecca-theme reverse-theme seti-theme smyx-theme soft-charcoal-theme soft-morning-theme soft-stone-theme solarized-theme soothe-theme autothemer spacegray-theme subatomic-theme subatomic256-theme sublime-themes sunny-day-theme tango-2-theme tango-plus-theme tangotango-theme tao-theme toxi-theme twilight-anti-bright-theme twilight-bright-theme twilight-theme ujelly-theme underwater-theme white-sand-theme zen-and-art-theme zenburn-theme zonokai-emacs treemacs-all-the-icons doom-modeline shrink-path groovy-imports pcache groovy-mode lsp-java maven-test-mode mvn company-go go-eldoc go-fill-struct go-gen-test go-guru go-impl go-rename go-tag go-mode godoctor json-mode json-navigator hierarchy json-reformat json-snatcher good-scroll atom-one-dark-theme github-theme blacken code-cells company-anaconda anaconda-mode cython-mode helm-cscope helm-pydoc importmagic epc ctable concurrent deferred live-py-mode lsp-pyright lsp-python-ms nose pip-requirements pipenv load-env-vars pippel poetry py-isort pydoc pyenv-mode pythonic pylookup pytest pyvenv sphinx-doc stickyfunc-enhance xcscope yapfify add-node-modules-path counsel-gtags counsel swiper ivy dap-mode lsp-docker bui ggtags helm-gtags impatient-mode htmlize import-js grizzl js-doc js2-refactor multiple-cursors livid-mode nodejs-repl npm-mode prettier-js skewer-mode js2-mode simple-httpd tern web-beautify yaml-mode yasnippet-snippets ws-butler writeroom-mode winum which-key volatile-highlights vim-powerline vi-tilde-fringe uuidgen use-package undo-tree treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil toc-org term-cursor symon symbol-overlay string-inflection string-edit-at-point spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline-all-the-icons space-doc smeargle restart-emacs request rainbow-delimiters quickrun popwin pcre2el password-generator paradox overseer org-superstar open-junk-file nameless multi-line mmm-mode markdown-toc macrostep lsp-ui lsp-treemacs lsp-origami lorem-ipsum link-hint inspector info+ indent-guide hybrid-mode hungry-delete holy-mode hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org helm-mode-manager helm-make helm-lsp helm-ls-git helm-git-grep helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gitignore-templates git-timemachine git-modes git-messenger git-link gh-md fuzzy forge font-lock+ flycheck-pos-tip flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-evilified-state evil-escape evil-easymotion evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu emr elisp-slime-nav elisp-def editorconfig dumb-jump drag-stuff dotenv-mode dired-quick-sort diminish devdocs define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent ace-link ace-jump-helm-line ac-ispell))
 '(pdf-view-midnight-colors '("#969896" . "#f8eec7"))
 '(treemacs-git-mode t)
 '(vc-annotate-background "#b0cde7")
 '(vc-annotate-color-map
   '((20 . "#969896")
     (40 . "#183691")
     (60 . "#969896")
     (80 . "#969896")
     (100 . "#969896")
     (120 . "#a71d5d")
     (140 . "#969896")
     (160 . "#969896")
     (180 . "#969896")
     (200 . "#969896")
     (220 . "#63a35c")
     (240 . "#0086b3")
     (260 . "#795da3")
     (280 . "#969896")
     (300 . "#0086b3")
     (320 . "#969896")
     (340 . "#a71d5d")
     (360 . "#969896")))
 '(vc-annotate-very-old-color "#969896"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
