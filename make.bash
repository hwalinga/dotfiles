#!/bin/bash

files=(".tmux.conf" ".zshrc" ".bashrc-user" ".vimrc" ".bash_aliases" 
    ".config/nvim/init.vim" ".bashrc")
folders=(.vim/{backupfiles,colors,pack,swapfiles,undodir,pack/git-plugins/start}
         .oh-my-zsh/custom/themes)

for folder in "${folders[@]}"; do 
    mkdir -p ~/$folder
done

mkdir ~/old_dotfiles
for file in "${files[@]}"; do 
    mkdir -p {file%/*}
    # file exists and is not a symbolic link.
    if [[ ! -h "$HOME/$file" && -f "$HOME/$file" ]]; then 
        mv ~/$file ~/old_dotfiles
    fi
    ln -s ~/dotfiles/${file##*/} ~/$file
done;



if [[ "$1" == "install-git" ]]; then 
    mkdir ~/git-tmp && cd $_

    # vim 
    # Poor-man's vim plugin installer
    git clone https://github.com/NLKNguyen/papercolor-theme
    ln -s $PWD/papercolor-theme/colors/PaperColor.vim ~/.vim/colors
    git clone https://github.com/w0rp/ale.git ~/.vim/pack/git-plugins/start/ale

    # zsh
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    git clone https://github.com/sobolevn/sobole-zsh-theme
    ln -s $PWD/sobole-zsh-theme/sobole.zsh-theme ~/.oh-my-zsh/custom/themes/sobole.zsh-theme
    echo 'Manually change terminal with `chsh -s `which zsh``'

    # This probably breaks
    git clone https://github.com/hwalinga/gnome-terminal-colors
    echo "Manually set up your terminal color schemes"
fi
