;;;;;;;;;;;;
;;;; UI ;;;;
;;;;;;;;;;;;

;;- Remove start msg
(setq inhibit-startup-message t)

;;- Disable scrollbar
(scroll-bar-mode -1)

;;- Disable toolbar
;;(tool-bar-mode -1)

;;- Disable tooltips
;;(tooltip-mode -1)

;;- Breathing room (?)
(set-fringe-mode 10)

;;- Set visible bell
(setq visible-bell t)

;;- Set Font(s)
;;(set-face-attribute 'default nil :font "ProggyCleanTT Nerd Font Mono Book" :height 120)
(set-face-attribute 'default nil :font "Hack Nerd Font Mono" :height 100)

;;;;;;;;;;;;;;;;;;
;;;; Keybinds ;;;;
;;;;;;;;;;;;;;;;;;

;; ESC to quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;;;;;;;;;;;;;;;;;
;;;; Packages ;;;;
;;;;;;;;;;;;;;;;;;

;;- Init package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;;- Init use-package on non Linux
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;- Command log mode
(use-package command-log-mode)

;;- vterm
(use-package vterm)

;;- base16 Themes
(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-summerfruit-light t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(vterm use-package command-log-mode base16-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
