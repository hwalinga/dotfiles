# .bashrc

# Do NOT edit this file.
# User specific aliases and functions go into .bashrc-user

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source user specific aliases and functions
if [ -f ${HOME}/.bashrc-user ]; then
    . ${HOME}/.bashrc-user
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/hielke/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/hielke/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/hielke/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/hielke/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/hielke/miniconda3/etc/profile.d/mamba.sh" ]; then
    . "/home/hielke/miniconda3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

. "$HOME/.cargo/env"
