if [ ! -n "$SHH_CLIENT" ] && [ ! -n "$SSH_TTY" ] && command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux
fi

# if [ -f ~/.zprofile ]; then
# 	. ~/.zprofile
# fi

# zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Color stderr red
export LD_PRELOAD="$HOME/repos/stderred/build/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"
# Alternatively: http://www.wikigentoo.ksiezyc.pl/Zsh.htm#Colorize_STDERR
# exec 2>>(while read line; do
# print '\e[91m'${(q)line}'\e[0m' > /dev/tty; print -n $'\0'; done &)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
SOBOLE_DEFAULT_USER="hpc"
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

export CONDA_ENVS_DIRS=/tudelft.net/staff-groups/ewi/insy/DBL/hwalinga/software/.conda/envs
zstyle ":conda_zsh_completion:*" show-unnamed true

plugins=(
  # poetry  TODO: https://github.com/python-poetry/poetry/issues/1734
  # git
  # command-not-found
  # web-search
  # sudo
  # python
  history
  # debian
  # dircycle
  # dirhistory
  # common-aliases
  # colored-man-pages
  # z
  # apply
  # zsh-syntax-highlighting
  # history-substring-search
  # zsh-completions
  # zsh-autosuggestions
  # tmux
  # extract
  # fzf
  # fancy-ctrl-z
  # zsh-prompt-benchmark
  # conda-zsh-completion
)
# [ -f /etc/zsh_command_not_found ] && . /etc/zsh_command_not_found

export DISABLE_MAGIC_FUNCTIONS="true"

# Being able to load a lot of files
ulimit -n 2048

source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit

bindkey '^ ' autosuggest-accept
bindkey '^o' forward-word
bindkey '^b' backward-word
bindkey \^U backward-kill-line
bindkey "^[r" redo
bindkey '^[[13;5u' accept-line
bindkey '^[[1;2D' insert-cycledleft
bindkey '^[[1;2C' insert-cycledright

# Disable "safe glob"
unsetopt nomatch
setopt cdablevars

alias -g latestdownload="\"\$( ls -tr ~/Downloads | tail -n 1 | sed 's:^:$HOME/Downloads/:')\""
unalias fd

# setopt NO_HIST_VERIFY # stops zsh from expanding !! notation when you hit enter

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions


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

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

remove-safely () {
        mount_path=${1:0:${#mount_point}-1}
        mount_point=$(mount | grep $mount_path | cut -d" " -f1)
        echo $mount_point
        sync
        udisksctl unmount -b $mount_point
        udisksctl power-off -b $mount_point
}

clear_half_screen() {
    mid=$(( (LINES+1)/2 ))
    # Insert empty rows
    for i in {1..$(( LINES-mid-1 ))}; echo
    # move to middle
    tput cup $mid 2
}
zle -N clear_half_screen
bindkey '^}' clear_half_screen

HISTSIZE=10000000
SAVEHIST=10000000
setopt SHARE_HISTORY

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# function git_prompt_info() {
#     ref=$(git-branch-name -q -h 12 -b 64) || return
#     echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${ref}${ZSH_THEME_GIT_PROMPT_CLEAN}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
# }

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
# export MAMBA_EXE="/home/nfs/hwalinga/repos/mamba/build/micromamba/micromamba";
# export MAMBA_ROOT_PREFIX="/tudelft.net/staff-groups/ewi/insy/DBL/hwalinga/software/micromamba";
# __mamba_setup="$('/home/nfs/hwalinga/repos/mamba/build/micromamba/micromamba' shell hook --shell zsh --prefix '/tudelft.net/staff-groups/ewi/insy/DBL/hwalinga/software/micromamba' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__mamba_setup"
# else
#     if [ -f "/tudelft.net/staff-groups/ewi/insy/DBL/hwalinga/software/micromamba/etc/profile.d/micromamba.sh" ]; then
#         . "/tudelft.net/staff-groups/ewi/insy/DBL/hwalinga/software/micromamba/etc/profile.d/micromamba.sh"
#     else
#         export  PATH="/tudelft.net/staff-groups/ewi/insy/DBL/hwalinga/software/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
#     fi
# fi
# unset __mamba_setup
# <<< mamba initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/tudelft.net/staff-groups/ewi/insy/DBL/hwalinga/software/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/tudelft.net/staff-groups/ewi/insy/DBL/hwalinga/software/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/tudelft.net/staff-groups/ewi/insy/DBL/hwalinga/software/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/tudelft.net/staff-groups/ewi/insy/DBL/hwalinga/software/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/tudelft.net/staff-groups/ewi/insy/DBL/hwalinga/software/miniconda3/etc/profile.d/mamba.sh" ]; then
    . "/tudelft.net/staff-groups/ewi/insy/DBL/hwalinga/software/miniconda3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<


alias conda=mamba
