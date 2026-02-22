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
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
