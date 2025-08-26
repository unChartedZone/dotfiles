;;; doom-molokai-rogue-theme.el --- Rogue's customized doom-molokai theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: January 21, 2025
;; Author: Rogue <https://github.com/lepisma>
;; Maintainer: Rogue <https://github.com/lepisma>
;; Source: https://github.com/lepisma/rogue
;;
;;; Commentary:
;;
;; A customized version of doom-molokai with extensive color customizations
;; extracted from the original spacemacs configuration.
;;
;;; Code:

(require 'doom-themes)

;;
;;; Variables

(defgroup doom-molokai-rogue-theme nil
  "Options for the `doom-molokai-rogue' theme."
  :group 'doom-themes)

(defcustom doom-molokai-rogue-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-molokai-rogue-theme
  :type 'boolean)

(defcustom doom-molokai-rogue-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-molokai-rogue-theme
  :type 'boolean)

(defcustom doom-molokai-rogue-comment-bg doom-molokai-rogue-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-molokai-rogue-theme
  :type 'boolean)

(defcustom doom-molokai-rogue-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-molokai-rogue-theme
  :type '(choice integer boolean))

;;
;;; Theme definition

(def-doom-theme doom-molokai-rogue
  "A dark, vibrant theme inspired by Molokai with extensive customizations."

  ;; name        default   256       16
  ((bg         '("#1C2028" "#1C2028" "black"      ))
   (fg         '("#ECEFF4" "#ECEFF4" "brightwhite"))

   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.
   (bg-alt     '("#2E3440" "#2E3440" "black"      ))
   (fg-alt     '("#D8DEE9" "#D8DEE9" "white"      ))

   ;; These should represent a spectrum from bg to fg, where base0 is a starker
   ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
   ;; dark grey, base0 should be white and base8 should be black.
   (base0      '("#1C2028" "#1C2028" "black"      ))
   (base1      '("#2E3440" "#2E3440" "brightblack"))
   (base2      '("#3B4252" "#3B4252" "brightblack"))
   (base3      '("#434C5E" "#434C5E" "brightblack"))
   (base4      '("#4C566A" "#4C566A" "brightblack"))
   (base5      '("#8a9899" "#8a9899" "brightblack"))
   (base6      '("#D8DEE9" "#D8DEE9" "brightwhite"))
   (base7      '("#E5E9F0" "#E5E9F0" "brightwhite"))
   (base8      '("#ECEFF4" "#ECEFF4" "white"      ))

   (grey       base5)
   (red        '("#BF616A" "#BF616A" "red"          ))
   (orange     '("#D08770" "#D08770" "brightred"    ))
   (green      '("#A3BE8C" "#A3BE8C" "green"        ))
   (teal       '("#8FBCBB" "#8FBCBB" "brightgreen"  ))
   (yellow     '("#EBCB8B" "#EBCB8B" "yellow"       ))
   (blue       '("#5E81AC" "#5E81AC" "brightblue"   ))
   (dark-blue  '("#81A1C1" "#81A1C1" "blue"         ))
   (magenta    '("#B48EAD" "#B48EAD" "brightmagenta"))
   (violet     '("#B48EAD" "#B48EAD" "magenta"      ))
   (cyan       '("#88C0D0" "#88C0D0" "brightcyan"   ))
   (dark-cyan  '("#8FBCBB" "#8FBCBB" "cyan"         ))

   ;; These are the "universal syntax classes" that doom-themes establishes.
   ;; These *must* be included in every doom theme, or your theme will throw an
   ;; error, as they are used throughout the base theme defined in doom-themes-base.
   (highlight      (doom-lighten base0 4))
   (vertical-bar   base2)
   (selection      base3)
   (builtin        orange)
   (comments       (if doom-molokai-rogue-brighter-comments cyan base4))
   (doc-comments   (doom-lighten base4 20))
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

   ;; These are extra color variables used only in this theme; i.e. they aren't
   ;; mandatory for derived themes.
   (modeline-fg              fg)
   (modeline-fg-alt          base6)
   (modeline-bg              (if doom-molokai-rogue-brighter-modeline
                                 (doom-darken blue 0.45)
                               base1))
   (modeline-bg-alt          (if doom-molokai-rogue-brighter-modeline
                                 (doom-darken blue 0.475)
                               `(,(doom-darken (car bg-alt) 0.15) ,@(cdr bg))))
   (modeline-bg-inactive     `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-alt `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg))))

  ;;;; Base theme face overrides
  (((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground builtin)
   ((font-lock-comment-face &override)
    :background (if doom-molokai-rogue-comment-bg (doom-lighten bg 0.05) 'unspecified)
    :slant 'italic)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if doom-molokai-rogue-padded-modeline `(:line-width ,(if (integerp doom-molokai-rogue-padded-modeline) doom-molokai-rogue-padded-modeline 4) :color ,modeline-bg) 'unspecified))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if doom-molokai-rogue-padded-modeline `(:line-width ,(if (integerp doom-molokai-rogue-padded-modeline) doom-molokai-rogue-padded-modeline 4) :color ,modeline-bg-inactive) 'unspecified))
   (mode-line-emphasis :foreground (if doom-molokai-rogue-brighter-modeline base8 highlight))

   ;;;; CSS mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;;;; Doom-specific overrides
   (doom-neotree-media-file-face :foreground type)
   (doom-neotree-data-file-face  :foreground doc-comments)
   (doom-neotree-hidden-file-face :foreground comments)
   (doom-neotree-dir-face        :foreground keywords)
   (doom-neotree-file-face       :foreground fg)
   (doom-neotree-text-file-face  :foreground fg)

   ;;;; Elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ;;;; Ivy
   (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)

   ;;;; LaTeX-mode
   (font-latex-math-face :foreground green)

   ;;;; Markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))

   ;;;; Org-mode
   (org-block :background bg-alt)
   (org-block-begin-line :background bg-alt :height 0.8 :foreground cyan)
   (org-block-end-line   :background bg-alt :height 0.8 :foreground cyan)
   (org-code :foreground builtin :inherit nil :height 0.9)
   (org-date :foreground doc-comments :height 0.8)
   (org-document-info :foreground grey :slant 'italic :height 1.2)
   (org-document-info-keyword :foreground comments :height 0.8)
   (org-document-title :height 1.3 :weight 'normal :foreground grey)
   (org-done :foreground blue :background bg :inherit 'variable-pitch)
   (org-ellipsis :underline nil :background base0 :foreground comments)
   (org-headline-done :strike-through t)
   (org-level-1 :height 1.3 :weight 'bold :foreground keywords :background bg :inherit 'variable-pitch)
   (org-level-2 :weight 'bold :height 1.2 :foreground grey :background bg :inherit 'variable-pitch)
   (org-level-3 :weight 'bold :height 1.1 :foreground grey :background bg :inherit 'variable-pitch)
   (org-level-4 :weight 'bold :height 1.1 :foreground grey :background bg :inherit 'variable-pitch)
   (org-level-5 :weight 'bold :height 1.1 :foreground grey :background bg :inherit 'variable-pitch)
   (org-level-6 :weight 'bold :height 1.1 :foreground grey :background bg :inherit 'variable-pitch)
   (org-level-7 :weight 'bold :height 1.1 :foreground grey :background bg :inherit 'variable-pitch)
   (org-level-8 :weight 'bold :height 1.1 :foreground grey :background bg :inherit 'variable-pitch)
   (org-link :underline nil :weight 'normal :foreground cyan)
   (org-list-dt :foreground functions)
   (org-quote :background bg)
   (org-ref-cite-face :foreground builtin)
   (org-scheduled :foreground grey)
   (org-scheduled-previously :foreground cyan)
   (org-scheduled-today :foreground fg)
   (org-special-keyword :height 0.9 :foreground comments)
   (org-table :background nil :foreground doc-comments :height 0.9)
   (org-tag :foreground doc-comments)
   (org-time-grid :foreground comments)
   (org-todo :foreground builtin :background bg)
   (org-upcoming-deadline :foreground keywords)
   (org-warning :foreground builtin)

   ;;;; Rjsx-mode
   (rjsx-tag :foreground red)
   (rjsx-attr :foreground orange)

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
    :box (if doom-molokai-rogue-padded-modeline `(:line-width ,(if (integerp doom-molokai-rogue-padded-modeline) doom-molokai-rogue-padded-modeline 4) :color ,modeline-bg-alt) 'unspecified))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-alt
    :box (if doom-molokai-rogue-padded-modeline `(:line-width ,(if (integerp doom-molokai-rogue-padded-modeline) doom-molokai-rogue-padded-modeline 4) :color ,modeline-bg-inactive-alt) 'unspecified))

   ;;;; Magit
   (magit-branch-current :foreground magenta)
   (magit-branch-local :foreground blue)
   (magit-branch-remote :foreground green)
   (magit-diff-added :background (doom-darken (doom-desaturate green 20) 50) :foreground (doom-darken green 10))
   (magit-diff-added-highlight :background (doom-darken (doom-desaturate green 20) 45) :foreground green)
   (magit-diff-hunk-heading :background region :foreground grey)
   (magit-diff-hunk-heading-highlight :background region :foreground fg)
   (magit-diff-lines-heading :background orange :weight 'bold :foreground bg)
   (magit-diff-removed :background (doom-darken (doom-desaturate red 40) 40) :foreground (doom-darken red 10))
   (magit-diff-removed-highlight :background (doom-darken (doom-desaturate red 40) 35) :foreground red)
   (magit-header-line :background nil :foreground bg :box nil)
   (magit-log-author :foreground orange)
   (magit-log-date :foreground blue)
   (magit-section-heading :foreground red)
   (magit-section-heading-selection :foreground yellow)

   ;;;; Company
   (company-scrollbar-bg :background base1)
   (company-scrollbar-fg :background comments)
   (company-tooltip :background base1 :foreground doc-comments)
   (company-tooltip-common :foreground keywords)
   (company-tooltip-mouse :background dark-blue)
   (company-tooltip-selection :background highlight)
   (company-tooltip-annotation :foreground type)

   ;;;; Helm
   (helm-M-x-key :foreground builtin)
   (helm-ff-directory :foreground builtin)
   (helm-ff-dotted-symlink-directory :background nil)
   (helm-ff-prefix :foreground keywords)
   (helm-ff-symlink :foreground cyan)
   (helm-grep-match :foreground constants)
   (helm-match :foreground keywords)
   (helm-selection :background highlight)
   (helm-separator :foreground keywords)

   ;;;; Swiper
   (swiper-line-face :background base3 :foreground fg)
   (swiper-match-face-2 :background builtin)

   ;;;; Git-gutter
   (git-gutter-fr:added :foreground strings)
   (git-gutter-fr:modified :foreground blue)

   ;;;; Flycheck
   (flycheck-error :background nil)
   (flycheck-warning :background nil)

   ;;;; Show paren
   (show-paren-match :background keywords :foreground bg)

   ;;;; Smartparens
   (sp-pair-overlay-face :background (doom-lighten bg 2))
   (sp-show-pair-match-face :background comments :foreground yellow)
   (sp-wrap-overlay-face :background (doom-lighten bg 2))

   ;;;; Eval sexp fu
   (eval-sexp-fu-flash :background blue :foreground fg)
   (eval-sexp-fu-flash-error :background keywords :foreground fg)

   ;;;; Which-key
   (which-key-command-description-face :foreground type)
   (which-key-key-face :foreground strings)

   ;;;; Tooltip
   (tooltip :foreground grey :background base1)

   ;;;; Vertical border
   (vertical-border :background region :foreground region)

   ;;;; Variable pitch
   (variable-pitch :family "Source Sans Pro")

   ;;;; Cursor
   (cursor :background red)

   ;;;; Highlight
   (highlight :background (doom-lighten base0 2) :foreground fg)

   ;;;; Hl-line
   (hl-line :background (doom-lighten base0 2))

   ;;;; Link
   (link :foreground cyan)

   ;;;; Minibuffer prompt
   (minibuffer-prompt :foreground keywords)

   ;;;; Region
   (region :background base3)

   ;;;; Font lock
   (font-lock-builtin-face :foreground builtin)
   (font-lock-comment-face :foreground doc-comments :slant 'italic)
   (font-lock-constant-face :foreground constants)
   (font-lock-doc-face :foreground doc-comments)
   (font-lock-function-name-face :foreground functions)
   (font-lock-keyword-face :foreground keywords)
   (font-lock-string-face :foreground strings)
   (font-lock-type-face :foreground type)
   (font-lock-variable-name-face :foreground variables)))

;;; doom-molokai-rogue-theme.el ends here