# 💤 LazyVim Installation
```bash
git clone https://github.com/leo-kre/IDE-Config.git ~/.config/nvim
```

# Ghostty Config

```bash
font-family = JetBrains Mono
font-size = 25

background-blur-radius = 20
background-opacity = 0.9

background = #181616
foreground = #d4d4d4

window-width = 160
window-height = 45
```
# Tmux Config

Catppuccin Setup

```bash
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
```

```bash
unbind r
##### reload
unbind r
bind r source-file ~/.tmux.conf \; display-message "tmux reloaded"

##### prefix
unbind C-b
set -g prefix C-s
bind C-s send-prefix

##### pane navigation
bind -r h select-pane -L
bind -r j select-pane -D
bind -r k select-pane -U
bind -r l select-pane -R

##### basics
set -g mouse on
set -g default-terminal "tmux-256color"
set -g status-position top
set -s escape-time 10
setw -g automatic-rename on
set -g allow-rename off
set -g renumber-windows on

##### transparent UI (inherit terminal background/opacity)
set -g status-style "bg=default,fg=#c5c9c5"
set -g status-left-length 100
set -g status-right-length 100

##### window line formatting with custom bg and spacing
# inactive window (slightly lighter bg)
set -g window-status-style "bg=#222222,fg=#c5c9c5"
set -g window-status-format '#[bg=#222222,fg=#727169][#I]#{?#{==:#{pane_current_command},nvim},#[fg=#6a9589],#{?#{==:#{pane_current_command},vim},#[fg=#6a9589],#{?#{==:#{pane_current_command},ssh},#[fg=#6a9589]󰣀,#{?#{==:#{pane_current_command},htop},#[fg=#6a9589]󰍛,#{?#{==:#{pane_current_command},lazygit},#[fg=#6a9589],#{?#{==:#{pane_current_command},git},#[fg=#6a9589],#{?#{==:#{pane_current_command},node},#[fg=#6a9589],#{?#{==:#{pane_current_command},python},#[fg=#6a9589],#[fg=#6a9589]}}}}}}}} #[fg=#c5c9c5]#W '

# current window (slightly lighter bg, stronger tints)
set -g window-status-current-style "bg=#2d2d2d,fg=#c5c9c5,bold"
set -g window-status-current-format '#[bg=#2d2d2d,fg=#c0a36e][#I]#{?#{==:#{pane_current_command},nvim},#[fg=#7e9cd8],#{?#{==:#{pane_current_command},vim},#[fg=#7e9cd8],#{?#{==:#{pane_current_command},ssh},#[fg=#7e9cd8]󰣀,#{?#{==:#{pane_current_command},htop},#[fg=#7e9cd8]󰍛,#{?#{==:#{pane_current_command},lazygit},#[fg=#7e9cd8],#{?#{==:#{pane_current_command},git},#[fg=#7e9cd8],#{?#{==:#{pane_current_command},node},#[fg=#7e9cd8],#{?#{==:#{pane_current_command},python},#[fg=#7e9cd8],#[fg=#7e9cd8]}}}}}}}} #[fg=#c5c9c5,bold]#W '

# add one space between window tiles
set -g window-status-separator " "

##### borders
set -g pane-border-style "fg=#2a2a2a"
set -g pane-active-border-style "fg=#6a9589"

##### messages / prompts / modes
set -g message-style "bg=default,fg=#c5c9c5"
set -g message-command-style "bg=default,fg=#c5c9c5"
set -g mode-style "bg=default,fg=#c5c9c5"

##### status content
set -g status-left "      #[bg=default,fg=#c5c9c5,bold] #[none]"
set -g status-right "#[bg=default,fg=#c5c9c5]󰆍 #{pane_current_command} #[fg=#727169]│ #[fg=#c5c9c5]#S  "

##### keep one empty line between status bar and terminal
set -g status 2
set -g status-format[1] ""   # ensure the extra line is empty

##### Catppuccin window text vars
set -g @catppuccin_window_text "#W"
set -g @catppuccin_window_current_text "#W"

##### plugins (TPM optional)
set -g @plugin 'tmux-plugins/tpm'
# run '~/.tmux/plugins/tpm/tpm'  # uncomment if you use TPM
```
