#!/bin/bash

DIR="${0%/*}"

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do
    case $1 in
        -n | --name )
            shift;
            GIT_USER_NAME=$1
            ;;
        -e | --email )
            shift;
            GIT_USER_EMAIL=$1
            ;;
        -h | --help | * )
            echo -e "Usage: $0 [--name USER_NAME] [--email USER_EMAIL]"
            exit
            ;;
    esac
    shift
done

if [[ "$1" == '--' ]]; then
    shift
fi

echo -e "Backup old files..."
if [[ ! -d ${DIR}/backup ]]; then
    echo -e " mkdir backup."
    mkdir -p ${DIR}/backup
fi
cp ~/.gitconfig ${DIR}/backup/gitconfig 2>/dev/null
if [[ -d ~/.config/git ]]; then
    echo -e "  copy ~/.config/git/ to backup folder."
    cp -r ~/.config/git/ ${DIR}/backup/gitrc/
fi
echo -e "Done.\n"

echo -e "Copy git configures..."
cp ${DIR}/gitconfig ~/.gitconfig
if [[ ! -d ~/.config/git ]]; then
    mkdir -p ~/.config/git
fi
cp -a ${DIR}/gitrc/. ~/.config/git
echo -e "Done.\n"

if [[ -n "${GIT_USER_NAME}" ]]; then
    git config --global user.name "${GIT_USER_NAME}"
    echo -e "RUN: git config --global user.name ${GIT_USER_NAME}"
else
    echo -e "To set Git user.name, please run: git config --global user.name \"your name\""
fi

if [[ -n "${GIT_USER_EMAIL}" ]]; then
    git config --global user.email "${GIT_USER_EMAIL}"
    echo -e "RUN: git config --global user.email ${GIT_USER_EMAIL}"
else
    echo -e "To set Git user.email, please run: git config --global user.email \"you@example.com\""
fi

echo -e "\nInstalled successfully! Enjoy :-)"

