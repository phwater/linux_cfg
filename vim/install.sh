#! /bin/bash

echo "copy vimrcs..."
cp vimrc ~/.vimrc
if [ ! -d "~/.vim/" ]; then
    mkdir -p ~/.vim/vimrcs/
fi
cp -a vimrcs/. ~/.vim/vimrcs
set runtimepath+=~/.vim
echo "done."

if [ ! -d "~/.vim/bundle" ]; then
    echo "install Vundle(using git)..."
    mkdir -p ~/.vim/bundle && cd ~/.vim/bundle/
    git clone https://github.com/VundleVim/Vundle.vim.git
    echo "done. Please use :PluginInstall cmd first launch Vim"
fi

echo "Installed successfully! Enjoy :-)"
