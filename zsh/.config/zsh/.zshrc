# options for colorize
ZSH_COLORIZE_CHROMA_FORMATTER=terminal256
ZSH_COLORIZE_STYLE="colorful"

HISTFILE="$HOME/.zsh_history"
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=100000
HISTFILESIZE=10000
SAVEHIST=7000
TERM=xterm-256color
export SHELL=`which zsh`
export EDITOR=nvim
export GREP_OPTIONS='--color=auto'
export CLICOLOR=1

# options
setopt nobeep
setopt auto_cd

# key binds
bindkey '^v' edit-command-line

bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search
bindkey '^h' backward-char
bindkey '^l' forward-char

# aliases
alias ls="exa"
alias l="exa -laBH"
alias cat="bat" # ~/.config/bat/config
alias headers="httpstat"
alias vim="~/local/nvim/bin/nvim"
alias vimconfig="cd ~/.config/nvim"
alias z="cat ~/.config/zsh/.zshrc"

alias g='git'
alias ga='git add .'
alias gst='git status'
alias gcm='git commit -m'
alias gw="git branch --sort=-committerdate | head -n 10"
alias gf="git fetch --all --prune"
alias gclean='git clean -fdx'

function output_colors() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

source ~/.config/zsh/.iterm2_shell_integration.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Need to config edit-command-line before sourcing zsh-syntax-highlighting
autoload edit-command-line; zle -N edit-command-line
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Must add completions to fpath after sourcing
source ~/.config/zsh/zsh-completions/zsh-completions.plugin.zsh
fpath=(~/.config/zsh/zsh-completions/src $fpath)

autoload -U compinit && compinit

eval "$(starship init zsh)"
