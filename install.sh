#!/bin/bash

echo "copy bash configures..."
cp bash/bashrc ~/.bashrc
if [ ! -d "~/.bash/" ]; then
    mkdir -p ~/.bash/
fi
cp bash/bash_aliases ~/.bash/
echo "done."

echo "copy git configure..."
cp git/gitconfig ~/.gitconfig
if [ ! -d "~/.gitrc/" ]; then
    mkdir -p ~/.gitrc/
fi
cp -a git/gitrc/. ~/.gitrc
echo "done."

echo "copy ack configure..."
cp ackrc ~/.ackrc
echo "done."

echo "Installed successfully! Enjoy :-)"
