#!/bin/bash

tm_icon="🍔 "
tm_color_background=colour234
# tm_color_background=colour255
tm_color_foreground=colour0
# tm_color_active="#FFFFFF"
tm_color_active=colour176
tm_color_inactive=colour241
tm_color_feature="#1EB0FC"
tm_color_music=colour203

# separators
tm_left_separator=''
tm_left_separator_black=''
tm_right_separator=''
tm_right_separator_black=''
tm_session_symbol=''

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5


# default statusbar colors
# set-option -g status-bg colour0
set-option -g status-fg $tm_color_active
set-option -g status-bg default
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg $tm_color_inactive
set-window-option -g window-status-bg default
set -g window-status-format "#I #W"

# active window title colors
set-window-option -g  window-status-current-format "#[fg=$tm_color_background,bg=$tm_color_active]$tm_left_separator_black #[fg=colour0,bg=$tm_color_active,bold]#I #W #[bg=$tm_color_background,fg=$tm_color_active]$tm_left_separator_black "

# pane border
set-option -g pane-border-fg $tm_color_inactive
set-option -g pane-active-border-fg $tm_color_active

# message text
set-option -g message-bg default
set-option -g message-fg $tm_color_active

# pane number display
set-option -g display-panes-active-colour $tm_color_active
set-option -g display-panes-colour $tm_color_inactive

tm_tunes="#[fg=$tm_color_music,bg=$tm_color_background]$tm_right_separator_black#[fg=$tm_color_background,bg=$tm_color_music]#(osascript ~/.dotfiles/applescripts/tunes.scpt)"
tm_date="#[bg=$tm_color_music,fg=$tm_color_active]$tm_right_separator_black#[bg=$tm_color_active,fg=$tm_color_background] %R %d %b"
tm_host="#[bg=$tm_color_active,fg=$tm_color_feature]$tm_right_separator_black#[bg=$tm_color_feature,fg=$tm_color_foreground,bold] #h "

tm_session_name="#[bg=$tm_color_feature,fg=$tm_color_background,bold]$tm_icon #S #[fg=$tm_color_feature,bg=default,nobold]$tm_left_separator_black"

set -g status-left $tm_session_name
set -g status-right $tm_tunes' '$tm_date' '$tm_host
