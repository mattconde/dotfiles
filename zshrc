export ZSH=$HOME/.oh-my-zsh

plugins=(cp git node npm docker golang colorize zsh-completions zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
ZSH_THEME="spaceship"

# Spaceship config
#
export SPACESHIP_PROMPT_SYMBOL="$"
export SPACESHIP_TIME_SHOW=true
export SPACESHIP_DIR_COLOR=blue
export SPACESHIP_GIT_STATUS_SHOW=false
export SPACESHIP_PACKAGE_SYMBOL=""
export SPACESHIP_NODE_SYMBOL=""
export SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  golang        # Go section
  julia         # Julia section
  venv          # virtualenv section
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Backgound jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# Go
#
export GOPATH=$HOME/projects/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Python bins
#
export PATH=$PATH:~/Library/Python/3.6/bin

# Useful aliases
#
alias la='ls -la'
alias stree='open -a SourceTree'
alias p='cd $HOME/projects/'
