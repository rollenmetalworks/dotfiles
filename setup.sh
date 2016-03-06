#!/bin/bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# check if there is an existing .vimrc in the home directory
TARGET_VIMRC=$HOME/.vimrc
TARGET_VIM_HOME_FOLDER=$HOME/.vim
PROJECT_ROOT=`dirname $0`
PROJECT_VIMRC=$PWD/.vimrc

if [ -a "$TARGET_VIMRC" ] || [ -L "$TARGET_VIMRC" ]; then
	echo "There is an existing vimrc file at $TARGET_VIMRC"
	exit;
fi

if [ -d "$TARGET_VIM_HOME_FOLDER" ]; then
	echo "There is an existing .vim folder at $VIM_HOME_FOLDER"
	exit;
else
	echo "Creating .vim folder"
	
fi

if [ ! -f "$PROJECT_VIMRC" ]; then
	echo "Unable to locate PROJECT_VIMRC at $PROJECT_VIMRC"
	exit;
fi

echo "Linking $PROJCET_VIMRC to $TARGET_VIMRC"
ln -s "$PROJECT_VIMRC" "$TARGET_VIMRC"
