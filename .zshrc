if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux
fi
# zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="sobole"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.


plugins=(
  # git
  command-not-found
  web-search
  # sudo
  # python
  history
  # debian
  dircycle
  dirhistory
  common-aliases
  colored-man-pages
  z
  # apply
  zsh-syntax-highlighting
  history-substring-search
  zsh-completions
  zsh-autosuggestions
  tmux
  extract
)
# [ -f /etc/zsh_command_not_found ] && . /etc/zsh_command_not_found

export PATH="$HOME/bin:$PATH"

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

bindkey '^ ' autosuggest-accept
bindkey '^o' forward-word
bindkey '^b' backword-word
bindkey \^U backward-kill-line


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

ee () {
    "$@" &! exit;
}

alias apt-install="apt-get --yes -t stretch-backports install"
alias sudo='sudo '
alias ssh='xdotool key F10; ssh'

unalias fd

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH="$PATH:$HOME/npm/bin"
export NODE_PATH="$NODE_PATH:$HOME/npm/lib/node_modules"

export HOMEBREW_PREFIX="/home/hielke/.linuxbrew"
export HOMEBREW_CELLAR="/home/hielke/.linuxbrew/Cellar"
export HOMEBREW_REPOSITORY="/home/hielke/.linuxbrew/Homebrew"
export MANPATH="/home/hielke/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/hielke/.linuxbrew/share/info:$INFOPATH"

export PATH="/home/hielke/.linuxbrew/bin:/home/hielke/.linuxbrew/sbin:$PATH"
# export PATH="$PATH:/home/hielke/.linuxbrew/bin:/home/hielke/.linuxbrew/sbin"

export PATH="$PATH:$HOME/programs/Xidel"

remove-safely () {
        mount_path=${1:0:${#mount_point}-1}
        mount_point=$(mount | grep $mount_path | cut -d" " -f1)
        echo $mount_point
        sync
        udisksctl unmount -b $mount_point
        udisksctl power-off -b $mount_point
}

PATH="/home/hielke/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/hielke/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/hielke/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/hielke/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/hielke/perl5"; export PERL_MM_OPT;

export PATH="$PATH:$HOME/programs/CRISPRCasFinder/bin"
#export MACSY_HOME="/home/hielke/programs/CRISPRCasFinder/macsyfinder-1.0.5/"

# eval `perl -I ~/perl5/lib/perl5 -Mlocal::lib`
export MANPATH=$HOME/perl5/man:$MANPATH
source ~/.venv/py3/bin/activate

# export PATH="$PATH:$HOME/.cargo/bin/"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

setopt cdablevars

# alias ssh="ssh -o IPQoS=0"
alias clusterlogin="ssh -t hwalinga@student-linux.tudelft.nl 'ssh sb-ont.tudelft.nl'"
alias xclusterlogin="ssh -t -X hwalinga@student-linux.tudelft.nl 'ssh -X sb-ont.tudelft.nl'"
alias mawk="$HOME/.linuxbrew/bin/mawk"
export LESS="-RXFMiX"
alias rg="rg -N"

# zprof
cat ~/Important

# source /home/hielke/.config/broot/launcher/bash/br
export PATH="$PATH:/home/hielke/programs/mummer/bin"
export PATH="$PATH:/home/hielke/programs/bin"

export PATH="$PATH:/home/hielke/.local/bin"
export PATH="$PATH:/home/hielke/.cargo/bin"

bindkey '^[[1;2D' insert-cycledleft
bindkey '^[[1;2C' insert-cycledright

# export W3MIMGDISPLAY_PATH="/home/hielke/.linuxbrew/Cellar/w3m/0.5.3_6/libexec/w3m/w3mimgdisplay"

# GENIUS WEB
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export JRE_HOME=$JAVA_HOME
# export CATALINA_HOME=/usr/share/tomcat8
# export CATALINA_BASE=/home/hielke/code/genius-web/catalina-home

export CATALINA_HOME=/home/hielke/code/genius-web/apache-tomcat-8.5.46/

# export CATALINA_PID="$CATALINA_BASE/tomcat.pid"
