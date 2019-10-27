#!/bin/bash

echo "backup old files..."
if [ ! -d ./backup ]; then
    echo "mkdir backup."
    mkdir -p ./backup
fi
cp ~/.bashrc ./backup/bashrc 2>/dev/null
cp ~/.bash_aliases ./backup/bash_aliases 2>/dev/null
echo "done."

echo "copy bash configures..."
cp ./bashrc ~/.bashrc
cp ./bash_aliases ~/.bash_aliases
echo "done."

echo "Installed successfully! Enjoy :-)"
