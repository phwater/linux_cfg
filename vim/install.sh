#!/bin/bash

DIR="${0%/*}"

echo -e "Copy vimrcs..."
cp ${DIR}/vimrc ~/.vimrc
if [ ! -d ~/.vim/vimrcs ]; then
    mkdir -p ~/.vim/vimrcs/
fi
cp -a ${DIR}/vimrcs/. ~/.vim/vimrcs
set runtimepath+=~/.vim
echo -e "Done.\n"

if [ ! -d ~/.vim/bundle/ ]; then
    echo -e "install Vundle(using git)..."
    mkdir -p ~/.vim/bundle && cd ~/.vim/bundle/
    git clone https://github.com/VundleVim/Vundle.vim.git
    echo -e "In Vim, use \':PluginInstall\' to install Vim plugins."
    echo -e "Done.\n"
fi

echo -e "Installed successfully! Enjoy :-)"
