#!/bin/bash

HELP="In the arguments specify what to install. Select: {dot, zsh, urxvt}"

if [[ $# -eq 0 || $1 == "--help" || $1 == "-h" ]]; then
    echo $HELP
fi

files=(
    ".tmux.conf" ".zshrc" ".bashrc-user" ".vimrc" ".bash_aliases"
    ".config/nvim/init.vim" ".gitconfig" ".gitignore"
)
# ".bashrc"
# ".Xdefaults" 
folders=(
    .vim/{backupfiles,colors,pack,swapfiles,undodir,pack/git-plugins/start}
     .oh-my-zsh/custom/themes .tmux-panes repos old_dotfiles
     old_bin
)
# .urxvt/ext
zsh_plugins=(
    zsh-completions
    zsh-syntax-highlighting
    zsh-autosuggestions
)
urxvt_plugins=(
    https://raw.githubusercontent.com/effigies/urxvt-perl/master/fullscreen
    https://raw.githubusercontent.com/majutsushi/urxvt-font-size/master/font-size
)

check_installed () {
    if [[ `apt list --installed | grep $1` ]]; then
        echo "$1 is not installed"
        exit 1
    fi
}

if [[ " $@ " =~ " dot " ]]; then

    echo "Make folders."
    for folder in "${folders[@]}"; do
        mkdir -p ~/$folder
    done

    echo "Symlink config files."
    for file in "${files[@]}"; do
        mkdir -p "${file%/*}"
        # file exists and is not a symbolic link.
        if [[ ! -h "$HOME/$file" && -f "$HOME/$file" ]]; then
            mv ~/$file ~/old_dotfiles
        fi
        ln -s ~/dotfiles/${file##*/} ~/$file
    done;

    echo "Create bin symlink."
    mv -t ~/old_bin ~/bin/*
    rmdir ~/bin
    ln -s ~/dotfiles/bin ~/bin

fi

if [[ " $@ " =~ " zsh " ]]; then

    # check_installed zsh

    echo "Configure zsh."

    cd ~/repos

    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

    git clone https://github.com/sobolevn/sobole-zsh-theme
    ln -s $PWD/sobole-zsh-theme/sobole.zsh-theme ~/.oh-my-zsh/custom/themes/sobole.zsh-theme

    for plugin in "${zsh_plugins[@]}"; do 
        git clone https://github.com/zsh-users/${plugin}.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/${plugin}
    done

    echo 'Manually change terminal with `chsh -s `which zsh``'

fi

if [[ " $@ " =~ " urxvt " ]]; then

    check_installed rxvt

    echo "Configure urxvt"
    mkdir -p ~/.urxvt/ext && cd $!
    for i in "${urxvt_plugins[@]}"; do
        wget $i
    done

fi
