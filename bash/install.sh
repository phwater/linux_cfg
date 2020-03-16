#!/bin/bash

DIR="${0%/*}"

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do
    case $1 in
        --restore )
            echo -e "Restore bashrc to default:"
            echo -e "RUN: /bin/cp /etc/skel/.bashrc ~/"
            /bin/cp /etc/skel/.bashrc ~/
            if [[ -e ~/.bash_aliases ]]; then
                rm ~/.bash_aliases
            fi
            echo -e "To make the change takes place immediately, please run : source ~/.bashrc"
            exit;
            ;;
        -h | --help | * )
            echo -e "Usage: $0 [--restore]"
            exit
            ;;
    esac
    shift
done

if [[ "$1" == '--' ]]; then
    shift
fi

echo -e "Backup old files..."
if [ ! -d ${DIR}/backup ]; then
    echo -e "  mkdir backup."
    mkdir -p ${DIR}/backup
fi
cp ~/.bashrc ${DIR}/backup/bashrc 2>/dev/null
cp ~/.bash_aliases ${DIR}/backup/bash_aliases 2>/dev/null
cp ~/.inputrc ${DIR}/backup/inputrc 2>/dev/null
echo -e "Done.\n"

echo -e "Copy bash configures..."
cp ${DIR}/bashrc ~/.bashrc
cp ${DIR}/bash_aliases ~/.bash_aliases
cp ${DIR}/inputrc ~/.inputrc
echo -e "Done.\n"

echo -e "To make the change takes place immediately, please run: source ~/.bashrc\n"

echo -e "Installed successfully! Enjoy :-)"
