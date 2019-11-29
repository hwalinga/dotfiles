#!/bin/bash

check_installed () {
    if [[ `apt list --installed | grep $1` ]]; then
        echo "$1 is not installed"
        exit
    fi
}

check_installed zsh
check_installed rxvt

files=(
    ".tmux.conf" ".zshrc" ".bashrc-user" ".vimrc" ".bash_aliases"
    ".config/nvim/init.vim" ".bashrc" ".Xdefaults"
)
folders=(
    .vim/{backupfiles,colors,pack,swapfiles,undodir,pack/git-plugins/start}
     .oh-my-zsh/custom/themes .tmux-panes .urxvt/ext repos old_dotfiles
)
urxvt_plugins=(
    https://raw.githubusercontent.com/effigies/urxvt-perl/master/fullscreen
    https://raw.githubusercontent.com/majutsushi/urxvt-font-size/master/font-size
)
zsh_plugins=(

)

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

echo "Configure zsh."
cd ~/repos
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/sobolevn/sobole-zsh-theme
ln -s $PWD/sobole-zsh-theme/sobole.zsh-theme ~/.oh-my-zsh/custom/themes/sobole.zsh-theme
echo 'Manually change terminal with `chsh -s `which zsh``'

echo "Configure urxvt"
cd ~/.urxvt/ext
for i in "${urxvt_plugins[@]}"; do
    wget $i
done
