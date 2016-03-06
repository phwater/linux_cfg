#! /bin/bash

echo "Backup vimrcs..."
cp ~/.vimrc ./vimrc
cp -r ~/.vim/vimrcs/* vimrcs/
cp ~/.vim/bundle/vim-airline/autoload/airline/themes/phwater.vim phwater.vim
echo "Done."
