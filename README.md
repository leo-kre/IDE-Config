# 💤 LazyVim Installation

git clone https://github.com/leo-kre/NvimConfig.git ~/.config/nvim

# Ghostty Config

```
font-family = JetBrains Mono
font-size = 20

background = #151515
foreground = #d4d4d4

window-width = 160
window-height = 45
```
# Tmux Config

Catppuccin Setup
```
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
```

```
unbind r
bind r source-file ~/.tmux.conf

unbind C-b
set-option -g prefix C-s
bind-key C-s send-prefix

bind -r h select-pane -L
bind -r j select-pane -D
bind -r k select-pane -U
bind -r l select-pane -R

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'catppuccin/tmux#v2.1.3'


# Options to make tmux more pleasant
set -g mouse on
set -g default-terminal "tmux-256color"

# Configure the catppuccin plugin
set -g @catppuccin_flavor "mocha"

# Load catppuccin
run ~/.config/tmux/plugins/catppuccin/tmux/catppuccin.tmux
# For TPM, instead use `run ~/.tmux/plugins/tmux/catppuccin.tmux`

# Make the status line pretty and add some modules
set -g status-right-length 100
set -g status-left-length 100
#set -g status-left "#{E:@catppuccin_status_session}"
set -g status-right "#{E:@catppuccin_status_application}"
set -ag status-right "#{E:@catppuccin_status_session}"

set -g @catppuccin_status_background "#151515"
set -g @catppuccin_window_flags "icon"

set -g @catppuccin_status_fill "icon"

set -g @catppuccin_window_status__right_style "basic"
set -g @catppuccin_window_flags_style "basic"

set -g @catppuccin_window_text "#W"
set -g @catppuccin_window_current_text "#W"

set -g status-position top

run ~/.config/tmux/plugins/catppuccin/tmux/catppuccin.tmux
```
