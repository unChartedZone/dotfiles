;;; spacemacs-light-rogue-theme.el --- Rogue's customized spacemacs-light theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: January 21, 2025
;; Author: Rogue <https://github.com/lepisma>
;; Maintainer: Rogue <https://github.com/lepisma>
;; Source: https://github.com/lepisma/rogue
;;
;;; Commentary:
;;
;; A customized version of spacemacs-light with extensive color customizations
;; extracted from the original spacemacs configuration. Features elegant typography
;; with EtBembo font and carefully balanced colors for a pleasant light theme experience.
;;
;;; Code:

(require 'doom-themes)

;;
;;; Variables

(defgroup spacemacs-light-rogue-theme nil
  "Options for the `spacemacs-light-rogue' theme."
  :group 'doom-themes)

(defcustom spacemacs-light-rogue-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'spacemacs-light-rogue-theme
  :type 'boolean)

(defcustom spacemacs-light-rogue-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'spacemacs-light-rogue-theme
  :type 'boolean)

(defcustom spacemacs-light-rogue-comment-bg spacemacs-light-rogue-brighter-comments
  "If non-nil, comments will have a subtle background. Enhancing their
legibility."
  :group 'spacemacs-light-rogue-theme
  :type 'boolean)

(defcustom spacemacs-light-rogue-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'spacemacs-light-rogue-theme
  :type '(choice integer boolean))

;;
;;; Theme definition

(def-doom-theme spacemacs-light-rogue
  "A light, elegant theme inspired by spacemacs-light with extensive customizations."

  ;; name        default   256       16
  ((bg         '("#FEFFF9" "#FEFFF9" "white"       ))
   (fg         '("#1C2028" "#1C2028" "black"       ))

   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.
   (bg-alt     '("#ECEFF4" "#ECEFF4" "brightwhite" ))
   (fg-alt     '("#2E3440" "#2E3440" "brightblack" ))

   ;; These should represent a spectrum from bg to fg, where base0 is a starker
   ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
   ;; dark grey, base0 should be white and base8 should be black.
   (base0      '("#FEFFF9" "#FEFFF9" "white"       ))
   (base1      '("#ECEFF4" "#ECEFF4" "brightwhite" ))
   (base2      '("#E5E9F0" "#E5E9F0" "brightwhite" ))
   (base3      '("#D8DEE9" "#D8DEE9" "brightwhite" ))
   (base4      '("#4C566A" "#4C566A" "brightblack" ))
   (base5      '("#434C5E" "#434C5E" "brightblack" ))
   (base6      '("#3B4252" "#3B4252" "brightblack" ))
   (base7      '("#2E3440" "#2E3440" "black"       ))
   (base8      '("#1C2028" "#1C2028" "black"       ))

   (grey       '("#8a9899" "#8a9899" "brightblack" ))
   (red        '("#BF616A" "#BF616A" "red"         ))
   (orange     '("#D08770" "#D08770" "brightred"   ))
   (green      '("#A3BE8C" "#A3BE8C" "green"       ))
   (teal       '("#8FBCBB" "#8FBCBB" "brightgreen" ))
   (yellow     '("#EBCB8B" "#EBCB8B" "yellow"      ))
   (blue       '("#5E81AC" "#5E81AC" "brightblue"  ))
   (dark-blue  '("#81A1C1" "#81A1C1" "blue"        ))
   (magenta    '("#B48EAD" "#B48EAD" "brightmagenta"))
   (violet     '("#B48EAD" "#B48EAD" "magenta"     ))
   (cyan       '("#88C0D0" "#88C0D0" "brightcyan"  ))
   (dark-cyan  '("#8FBCBB" "#8FBCBB" "cyan"        ))

   ;; Face categories -- These are used in the theme
   (highlight      (doom-lighten base3 10))
   (vertical-bar   base2)
   (selection      base2)
   (builtin        orange)
   (comments       (if spacemacs-light-rogue-brighter-comments base4 base4))
   (doc-comments   base4)
   (constants      violet)
   (functions      cyan)
   (keywords       red)
   (methods        cyan)
   (operators      red)
   (type           teal)
   (strings        green)
   (variables      yellow)
   (numbers        violet)
   (region         base3)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    blue)
   (vc-added       green)
   (vc-deleted     red)

   ;; These are extra color variables used only in this theme
   (modeline-fg              fg)
   (modeline-fg-alt          base5)
   (modeline-bg              (if spacemacs-light-rogue-brighter-modeline
                                 (doom-lighten blue 0.45)
                               bg))
   (modeline-bg-alt          (if spacemacs-light-rogue-brighter-modeline
                                 (doom-lighten blue 0.475)
                               bg))
   (modeline-bg-inactive     bg)
   (modeline-bg-inactive-alt bg))

  ;;;; Base theme face overrides
  (((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground bg :background base8)
   ((font-lock-comment-face &override)
    :background (if spacemacs-light-rogue-comment-bg 'unspecified 'unspecified)
    :foreground doc-comments
    :slant 'italic)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if spacemacs-light-rogue-padded-modeline `(:line-width ,(if (integerp spacemacs-light-rogue-padded-modeline) spacemacs-light-rogue-padded-modeline 4) :color ,modeline-bg) 'unspecified))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if spacemacs-light-rogue-padded-modeline `(:line-width ,(if (integerp spacemacs-light-rogue-padded-modeline) spacemacs-light-rogue-padded-modeline 4) :color ,modeline-bg-inactive) 'unspecified))

   ;;;; CSS mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;;;; Doom-specific overrides
   (doom-neotree-media-file-face :foreground type :family "Source Sans Pro" :height 1.0)
   (doom-neotree-data-file-face  :foreground doc-comments :family "Source Sans Pro" :height 1.0)
   (doom-neotree-hidden-file-face :foreground comments :family "Source Sans Pro" :height 1.0)
   (doom-neotree-dir-face        :family "Source Sans Pro" :height 1.0)
   (doom-neotree-file-face       :family "Source Sans Pro" :height 1.0)
   (doom-neotree-text-file-face  :family "Source Sans Pro" :height 1.0)

   ;;;; Ivy
   (ivy-current-match :background highlight :distant-foreground base0 :weight 'normal)

   ;;;; LaTeX-mode
   (font-latex-math-face :foreground green)

   ;;;; Markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)

   ;;;; Org-mode
   (org-block :background nil :foreground bg :inherit nil)
   (org-block-begin-line :background nil :height 0.8 :foreground cyan)
   (org-block-end-line   :background nil :height 0.8 :foreground cyan)
   (org-code :inherit nil :foreground comments :height 0.9)
   (org-date :height 0.8)
   (org-document-info :height 1.2 :slant 'italic)
   (org-document-info-keyword :height 0.8 :foreground grey)
   (org-document-title :inherit nil :family "EtBembo" :height 1.7 :foreground bg :underline nil)
   (org-done :strike-through t :family "EtBembo")
   (org-ellipsis :underline nil :foreground comments)
   (org-headline-done :family "EtBembo" :strike-through t)
   (org-hide :foreground bg)
   (org-indent :inherit '(org-hide fixed-pitch))
   (org-level-1 :inherit nil :family "EtBembo" :height 1.8 :weight 'normal :slant 'normal :foreground bg)
   (org-level-2 :inherit nil :family "EtBembo" :weight 'normal :height 1.6 :slant 'italic :foreground bg)
   (org-level-3 :inherit nil :family "EtBembo" :weight 'normal :slant 'italic :height 1.5 :foreground bg)
   (org-level-4 :inherit nil :family "EtBembo" :weight 'normal :slant 'italic :height 1.3 :foreground bg)
   (org-link :foreground bg)
   (org-ref-cite-face :foreground builtin)
   (org-special-keyword :height 0.8)
   (org-table :height 0.9 :background bg)
   (org-tag :foreground doc-comments)

   ;;;; Rainbow delimiters
   (rainbow-delimiters-depth-1-face :foreground blue)
   (rainbow-delimiters-depth-2-face :foreground red)
   (rainbow-delimiters-depth-3-face :foreground violet)
   (rainbow-delimiters-depth-4-face :foreground orange)
   (rainbow-delimiters-depth-5-face :foreground dark-blue)
   (rainbow-delimiters-depth-6-face :foreground green)
   (rainbow-delimiters-depth-7-face :foreground cyan)
   (rainbow-delimiters-depth-8-face :foreground yellow)
   (rainbow-delimiters-depth-9-face :foreground teal)

   ;;;; Solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if spacemacs-light-rogue-padded-modeline `(:line-width ,(if (integerp spacemacs-light-rogue-padded-modeline) spacemacs-light-rogue-padded-modeline 4) :color ,modeline-bg-alt) 'unspecified))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-alt
    :box (if spacemacs-light-rogue-padded-modeline `(:line-width ,(if (integerp spacemacs-light-rogue-padded-modeline) spacemacs-light-rogue-padded-modeline 4) :color ,modeline-bg-inactive-alt) 'unspecified))

   ;;;; Company
   (company-tooltip :background bg :foreground fg)

   ;;;; Helm
   (helm-buffer-file :background bg)
   (helm-ff-directory :background bg)
   (helm-ff-file :background bg)

   ;;;; Font lock
   (font-lock-comment-face :background nil :foreground doc-comments :slant 'italic)

   ;;;; Highlight
   (highlight :background highlight)

   ;;;; Linum
   (linum :background bg)

   ;;;; Magit
   (magit-header-line :background nil :foreground bg :box nil)

   ;;;; Mode line
   (mode-line :background bg :box nil)
   (mode-line-inactive :box nil)

   ;;;; Powerline
   (powerline-active1 :background bg)
   (powerline-active2 :background bg)
   (powerline-inactive1 :background bg)
   (powerline-inactive2 :background bg)

   ;;;; Variable pitch for elegant typography
   (variable-pitch :family "EtBembo" :background nil :foreground bg :height 1.0)

   ;;;; Which-key
   (which-key-command-description-face :foreground type)
   (which-key-key-face :foreground strings))

;;; spacemacs-light-rogue-theme.el ends here