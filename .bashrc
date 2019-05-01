# .bashrc

# Do NOT edit this file.
# User specific aliases and functions go into .bashrc-user

# Source global definitions for el5 machines
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source user specific aliases and functions
if [ -f ${HOME}/.bashrc-user ]; then
    . ${HOME}/.bashrc-user
fi
