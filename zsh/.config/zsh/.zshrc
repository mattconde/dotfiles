# options for colorize
ZSH_COLORIZE_CHROMA_FORMATTER=terminal256
ZSH_COLORIZE_STYLE="colorful"

export HISTFILE=~/.zsh_history
export HISTFILESIZE=100000
export HISTSIZE=100000
export HISTTIMEFORMAT="[%F %T] "

# add timestamp to history
setopt EXTENDED_HISTORY
# immediately append to history
setopt INC_APPEND_HISTORY
# find no dupes to history
setopt HIST_FIND_NO_DUPS
# save no dupes to history
setopt HIST_IGNORE_ALL_DUPS

TERM=xterm-256color
export SHELL=`which zsh`
export EDITOR=nvim
export GREP_OPTIONS="--color=auto"
export CLICOLOR=1

# disable error sound
setopt nobeep

# auto change directory
setopt auto_cd

# aliases
alias ls="exa"
alias l="exa --all --header --long --icons --git --group --accessed --modified --created"
alias cat="bat"
alias headers="httpstat"
alias vim="~/local/nvim/bin/nvim"
alias dotfiles="cd ~/.dotfiles"
alias z="bat ~/.config/zsh/.zshrc"

alias g="git"
alias ga="git add ."
alias gst="git status"
alias gcm="git commit -m"
alias gw="git branch --sort=-committerdate | head -n 10"
alias gf="git fetch --all --prune"
alias gclean="git clean -fdx"
alias gdb='git branch | grep -v "develop" | xargs git branch -D'

alias disableDev="sudo spctl --master-disable"
alias enableDev="sudo spctl --master-enable"

echo "aliases: headers, dotfiles, z, g, ga, gf, gw, gclean"

function output_colors() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

# iTerm2 Shell Integration - https://iterm2.com/documentation-shell-integration.html
# eg. Drag & drop, History integration, Recent directories OS wide
source ~/.config/zsh/.iterm2_shell_integration.zsh

#
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Need to config edit-command-line before sourcing zsh-syntax-highlighting
autoload edit-command-line; zle -N edit-command-line
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-history-substring-search - https://github.com/zsh-users/zsh-history-substring-search
# Fish shell's history search feature, where you can type in any part of any command from history and then press chosen keys, such as the UP and DOWN arrows, to cycle through matches.
# Must follow zsh-syntax-highlighting
source ~/.config/zsh/zsh-history-substring-search.zsh

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# Must add completions to fpath after sourcing
source ~/.config/zsh/zsh-completions/zsh-completions.plugin.zsh
fpath=(~/.config/zsh/zsh-completions/src $fpath)

autoload -U compinit && compinit

eval $(thefuck --alias)
eval "$(starship init zsh)"
