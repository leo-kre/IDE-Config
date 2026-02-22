# 📦 Required Packages

```bash
brew install node hadolint python git tmux nvim pipx
```

# 💤 LazyVim Installation MacOS



```bash
git clone https://github.com/leo-kre/IDE-Config.git ~/.config/nvim
```

# 👻 Ghostty Config

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
# 🪟 Tmux Config

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

# 📋 Zshrc config

```bash
brew install eza
brew install thefuck
````

```bash
nvim ~/.zshrc
```

```bash
############################################################
# PATH
############################################################
typeset -U path PATH
path=(
  /opt/homebrew/bin
  $HOME/.local/bin
  $HOME/bin
  $path
)
export PATH

############################################################
# Global monochrome policy
############################################################
export NO_COLOR=1
export CLICOLOR=0

############################################################
# Zinit
############################################################
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

############################################################
# Completion
############################################################
autoload -Uz compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
compinit

############################################################
# History
############################################################
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=$HOME/.zsh_history

setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

############################################################
# Keybindings
############################################################
bindkey -e
bindkey "^n" history-search-backward
bindkey "^p" history-search-forward

############################################################
# eza — TRUE MONOCHROME
############################################################
alias ls='eza --git -G -a --hyperlink --no-permissions --no-user -L 1 --color=never'

############################################################
# Git monochrome
############################################################
git config --global color.ui never >/dev/null 2>&1

############################################################
# Gray-scale syntax highlighting
############################################################
typeset -gA ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[default]='fg=250'
ZSH_HIGHLIGHT_STYLES[command]='fg=250'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=250'
ZSH_HIGHLIGHT_STYLES[function]='fg=250'
ZSH_HIGHLIGHT_STYLES[alias]='fg=250'
ZSH_HIGHLIGHT_STYLES[path]='fg=250'

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=242'
ZSH_HIGHLIGHT_STYLES[comment]='fg=242'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=245'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=245'

############################################################
# Autosuggestions (dim gray)
############################################################
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

############################################################
# Coal / IBM prompt
############################################################
setopt promptsubst

PROMPT='%F{250}%~%f %F{255}❯%f '

RPROMPT='%F{242}%*%f'

############################################################
# Optional extras
############################################################
eval "$(thefuck --alias fuck)"
[
```
