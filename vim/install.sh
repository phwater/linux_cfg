#! /bin/bash

echo "Copy vimrcs..."
cp vimrc ~/.vimrc
cp -r vimrcs ~/.vim/vimrcs
set runtimepath+=~/.vim

echo "Install Vundle(using git)..."
mkdir -p ~/.vim/bundle && cd ~/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git

echo "Installed successfully! Enjoy :-)"
