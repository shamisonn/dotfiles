#!/bin/bash

prefix=$(pwd)

mkdir -p ~/.config/zsh
mkdir -p ~/.config/nvim

ln -fns $prefix/gitignore ~/.gitignore
ln -fns $prefix/zshenv ~/.zshenv
ln -fns $prefix/tmux.conf ~/.tmux.conf
ln -fns $prefix/zshrc ~/.config/zsh/.zshrc
ln -fns $prefix/init.vim ~/.config/nvim/init.vim

