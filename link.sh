#! /bin/bash

prefix=$(pwd)

ln -fns $prefix/.emacs.d ~/.emacs.d
ln -fns $prefix/.gitconfig ~/.gitconfig
ln -fns $prefix/.gitignore ~/.gitignore
ln -fns $prefix/.latexmkrc ~/.latexmkrc
#ln -fns $prefix/.zshrc ~/.zshrc
ln -fns $prefix/.vimrc ~/.vimrc
ln -fns $prefix/config.fish ~/.config/fish/config.fish

