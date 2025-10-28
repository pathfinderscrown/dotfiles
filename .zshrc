# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.

# ===== CUSTOM ZSH CONFIGURATION PATHS =====

# Homebrew completions
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

# Define Custom Directories
export ZSH_CUSTOM_DIR="$HOME/Documents/Scripts/zsh" # Define custom zsh directory
export ZSH="$ZSH_CUSTOM_DIR/.oh-my-zsh" # Update Oh My Zsh path
export ZPLUG_HOME="$ZSH_CUSTOM_DIR/.zplug" # Update Zplug path (if you use it)
export HISTFILE="$ZSH_CUSTOM_DIR/.zsh_history" # Update history file location
export ZSH_SESSIONS_DIR="$ZSH_CUSTOM_DIR/.zsh_sessions" # Update session directory (if needed)

export ZSH="$HOME/Documents/Scripts/zsh/.oh-my-zsh" # Update oh-my-zsh path

# Add this if you use Zplug:
if [[ -f "$ZPLUG_HOME/init.zsh" ]]; then
    source "$ZPLUG_HOME/init.zsh"
fi

# Set name of the theme to load --- if set to "random", it will
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k" 


# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7


# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
  git
  bundler
  dotenv
  rake
  rbenv
  ruby
  1password
  aliases
  Alias-finder
  Colored-man-pages
  emoji
  jsontools
  zsh-autosuggestions
  zsh-syntax-highlighting  
  Sudo
  colorize
  history
  emoji
  encode64
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"



# 1Password CLI integration
if command -v op &> /dev/null; then
    eval "$(op completion zsh)"; compdef _op op
fi


# Symlink to the Operations Folder:
if [ ! -e ~/operations ]; then # Ensure operations symlink exists
    ln -s ~/Documents/Talque/operations ~/operations
fi

# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="code ~/.zshrc"
# alias ohmyzsh="code ~/.oh-my-zsh"
alias bruwu="brew update && brew upgrade && brew cleanup"
alias ..='cd ..'

# Aliases for listing
alias lss='list_scripts'
alias lspy='list_python_scripts'
alias ll='ls -alF'

# Quick access to zsh config files
alias zshconfig='code "$ZSH_CUSTOM_DIR/.zshrc"'
alias zshdir='cd "$ZSH_CUSTOM_DIR"'
alias ohmyzsh='cd "$ZSH"'
alias pip='pip3'

# Path Alias for Talque
alias talque='cd /Users/gregormay/Documents/Talque'

# Aliases for onepass items
alias opget='op item get'
alias oplist='op item list'
alias opssh='op item list --categories "SSH Key"'

# Alias for alway starting 
alias talque-py='source /Users/gregormay/Documents/Scripts/Python/venv/bin/activate'

# Alias to fetch and check for updates in the Talque Github Repo
alias talque-git-update-all='echo "📦 Checking operations..." && cd ~/Documents/Talque/operations && git fetch && git status && echo "\n📦 Checking talque..." && cd ~/Documents/Talque/talque && git fetch && git status'
alias talque-git-update-ops='echo "📦 Checking operations..." && cd ~/Documents/Talque/operations && git fetch && git status && echo "\n📦 Checking talque..." && cd ~/Documents/Talque/talque && git fetch && git status'
alias talque-git-update-dev='echo "📦 Checking talque devs..." && cd ~/Documents/Talque/talque && git fetch && git status'

# Alias to pull updates in the Talque Github Repo
alias talque-git-pull-all='echo "📦 Pulling operations repo updates..." && cd ~/Documents/Talque/operations && git pull && echo "📦 Pulling talque repo updates..." && cd ~/Documents/Talque/talque && git pull'
alias talque-git-pull-ops='echo "📦 Pulling operations repo updates..." && cd ~/Documents/Talque/operations && git pull'
alias talque-git-pull-talque='echo "📦 Pulling talque repo updates..." && cd ~/Documents/Talque/talque && git pull'

# Alias to open cheetsheats from the Talque Documentation
alias talque-git-cheatsheet='echo "📦 opening the talque git cheatsheet..." && open https://talque.atlassian.net/wiki/spaces/OPS/pages/218300734/git+github+cheatsheet'
alias cheatsheet='echo "📦 opening the talque git cheatsheet..." && open https://talque.atlassian.net/wiki/spaces/OPS/pages/218300734/git+github+cheatsheet'
alias git-cheatsheet='echo "📦 opening the talque git cheatsheet..." && open https://talque.atlassian.net/wiki/spaces/OPS/pages/218300734/git+github+cheatsheet'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/Documents/Scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Created by `pipx` on 2025-10-27 08:21:57
export PATH="$PATH:/Users/gregormay/.local/bin"
alias code-chat='ollama run codeqwen:latest'
