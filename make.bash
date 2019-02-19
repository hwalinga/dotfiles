#!/bin/bash

files=(".tmux.conf" ".zshrc" ".bashrc" ".vimrc")
folders=(.vim/{backupfiles,colors,pack,swapfiles,undodir,pack/git-plugins/start}
         .oh-my-zsh/custom/themes)

for folder in "${folders[@]}"; do 
    mkdir -p $folder
done

mkdir ~/old_dotfiles
for file in "${files[@]}"; do 
    cd
    ln -sb --suffix=.dotfile $file ~/dotfiles/${file##*/}
done;
mv *.dotfile ~/old_dotfiles
mv ~/old_dotfiles{.dotfile,}

# Poor-man's vim plugin installer

mkdir ~/git-tmp && cd $_

git clone https://github.com/NLKNguyen/papercolor-theme
ln -s papercolor-theme/colors/PaperColor.vim ~/.vim/colors

git clone https://github.com/sobolevn/sobole-zsh-theme
ln -s sobole-zsh-theme/sobole.zsh-theme ~/.oh-my-zsh/custom/themes/sobole.zsh-theme

git clone https://github.com/w0rp/ale.git ~/.vim/pack/git-plugins/start/ale

# This probably breaks
git clone https://github.com/hwalinga/gnome-terminal-colors
echo "Manually set up your terminal color schemes"
