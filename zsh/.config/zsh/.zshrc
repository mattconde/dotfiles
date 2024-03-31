###
# ZSH Plugins
###

# iTerm2 Shell Integration - https://iterm2.com/documentation-shell-integration.html
# eg. Drag & drop, History integration, Recent directories OS wide
source ~/.config/zsh/.iterm2_shell_integration.zsh

#
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Need to config edit-command-line before sourcing zsh-syntax-highlighting
autoload edit-command-line; zle -N edit-command-line
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-history-substring-search - https://github.com/zsh-users/zsh-history-substring-search
# Fish shell's history search feature, where you can type in any part of any command from
# history and then press chosen keys, such as the UP and DOWN arrows, to cycle through matches.
# Must follow zsh-syntax-highlighting
source ~/.config/zsh/zsh-history-substring-search.zsh

# Must add completions to fpath after sourcing
source ~/.config/zsh/zsh-completions/zsh-completions.plugin.zsh
fpath=(~/.config/zsh/zsh-completions/src $fpath)

# web search aliases
source ~/.config/zsh/web-search.zsh

###
# Options
###

# options for colorize
ZSH_COLORIZE_CHROMA_FORMATTER=terminal256
ZSH_COLORIZE_STYLE="colorful"

export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000001
export HISTSIZE=1000000001 # must be bigger than SAVEHIST
export SAVEHIST=1000000000
export HISTTIMEFORMAT="[%F %T] "

# add timestamp to history
setopt EXTENDED_HISTORY
# immediately append to history
setopt INC_APPEND_HISTORY
# find no dupes to history
setopt HIST_FIND_NO_DUPS
# if a dupe is added to history the older one is removed
setopt HIST_IGNORE_ALL_DUPS
# do not enter in history if is dupe
setopt HIST_IGNORE_DUPS
# trim oldest duplicate first
setopt HIST_EXPIRE_DUPS_FIRST
# remove entries from history where first character is space
setopt HIST_IGNORE_SPACE
# when saving history older entries that dupe newer ones are omitted
setopt HIST_SAVE_NO_DUPS

export TERM=screen-256color
export SHELL=`which zsh`
export EDITOR=nvim
export GREP_OPTIONS="--color=auto"
export CLICOLOR=1

# disable error sound
setopt nobeep

# auto change directory
setopt auto_cd

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

###
# Mappings
###

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

###
# Aliases
###

alias ls="exa"
alias lt="exa --all --header --long --icons --git --no-time --no-user --tree --level=2 --ignore-glob=node_modules"
alias l="exa --all --header --long --icons --git --no-time --no-user"
alias la="exa --all --header --long --icons --git --group --accessed --modified --created"
alias cat="bat"
alias vim="nvim"
alias python="python3"
alias dotfiles="cd ~/.dotfiles"
alias projects="cd ~/projects"
alias z="bat ~/.config/zsh/.zshrc"
alias s="source ~/.zshrc"

alias g="git"
alias ga="git add ."
alias gc="git clean -fdx"
alias gr="git clean -fdx && git restore ."
alias gst="git status"
alias gs="git status --short && git diff --shortstat"
alias gcm="git commit -m"
alias gw="git branch --sort=-committerdate | head -n 10"
alias gf="git fetch --all --prune"
alias gcleanbranches='git branch | grep -v "develop" | xargs git branch -D'

alias disableDev="sudo spctl --master-disable"
alias enableDev="sudo spctl --master-enable"

echo "web search: google, ddg, github, yt"
echo "git: g, ga, gst, gcm, gf, gw, gcleanfiles, gcleanbranches"
echo "aliases: l, lt, la, z, s"
echo ""

function outputColors() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

function timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

function p() {
  local projectsDirectory=($(find ~/projects -type d -maxdepth 1))
  local extraProjects=("~/.dotfiles")
  local allProjects=""
  for PROJECT_PATH in $projectsDirectory; do
    eval fullPath="$PROJECT_PATH "
    allProjects+="${fullPath}\n"
  done

  for PROJECT_PATH in $extraProjects; do
    eval fullPath="$PROJECT_PATH"
    allProjects+="${fullPath}\n"
  done

  local selectedProjectPath=$(echo $allProjects | fzf)
  local selectedProjectBasename=$(basename $selectedProjectPath)
  # remove all non-alpha characters
  # ie. .dotfiles is handled differently in the commands below
  local selectedProjectName="${selectedProjectBasename//[^[:alpha:]]/}"
  cd $selectedProjectPath
}

###
# Setups
###

autoload -U compinit && compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"
alias luamake="~/projects/lua-language-server/3rd/luamake/luamake"
export PATH="$HOME/local/nvim/bin:$(yarn global bin):$HOME/projects/lua-language-server/bin:$PATH"

