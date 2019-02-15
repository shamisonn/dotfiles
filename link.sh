#!/bin/bash

prefix=$(pwd)

ln -fns $prefix/emacs.d ~/.emacs.d
ln -fns $prefix/gitconfig ~/.gitconfig
ln -fns $prefix/gitignore ~/.gitignore
ln -fns $prefix/latexmkrc ~/.latexmkrc
#ln -fns $prefix/.zshrc ~/.zshrc
mkdir -p ~/.config/fish 
ln -fns $prefix/config.fish ~/.config/fish/config.fish

# nvim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm ./installer.sh
mkdir -p ~/.config/nvim
ln -fns $prefix/init.vim ~/.config/nvim/init.vim

