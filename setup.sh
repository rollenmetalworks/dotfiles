#!/bin/bash

# check if there is an existing .vimrc in the home directory
TARGET_VIMRC=$HOME/.vimrc
TARGET_VIM_HOME_FOLDER=$HOME/.vim
PROJECT_ROOT=`dirname $0`
PROJECT_VIMRC=$PROJECT_ROOT/.vimrc

if [ -a "$TARGET_VIMRC" ]; then
	echo "There is an existing vimrc file at $VIMRC"
	exit;
fi

if [ -d "$TARGET_VIM_HOME_FOLDER" ]; then
	echo "There is an existing .vim folder at $VIM_HOME_FOLDER"
	exit;
fi

if [ ! -a "$PROJECT_VIMRC" ]; then
	echo "Unable to locate PROJECT_VIMRC at $PROJECT_VIMRC"
	exit;
fi
ln -s "$PROJECT_VIMRC" "TARGET_VIMRC"
