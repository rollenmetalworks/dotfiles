#/bin/bash

# Install Homebrew
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# check if there is an existing .vimrc in the home directory
TARGET_VIMRC=$HOME/.vimrc
TARGET_NVIMRC=$HOME/.config/nvim/init.vim
TARGET_VIM_HOME_FOLDER=$HOME/.vim
TARGET_NVIM_HOME_FOLDER=$HOME/.nvim
PROJECT_ROOT=`dirname $0`
PROJECT_VIMRC=$PWD/.vimrc

QUIT=false;
if [ -a "$TARGET_VIMRC" ] || [ -L "$TARGET_VIMRC" ]; then
	echo "There is an existing vimrc file at $TARGET_VIMRC"
	QUIT=true
fi

if [ -a "$TARGET_NVIMRC" ] || [ -L "$TARGET_NVIMRC" ]; then
	echo "There is an existing nvimrc file at $TARGET_NVIMRC"
	QUIT=true
fi

if [ -d "$TARGET_VIM_HOME_FOLDER" ]; then
	echo "There is an existing .vim folder at $TARGET_VIM_HOME_FOLDER"
	QUIT=true
fi

if [ -L "$TARGET_NVIM_HOME_FOLDER" ]; then
	echo "There is an existing .nvim folder at $TARGET_NVIM_HOME_FOLDER"
	QUIT=true
fi

if [ ! -f "$PROJECT_VIMRC" ]; then
	echo "Unable to locate PROJECT_VIMRC at $PROJECT_VIMRC"
	QUIT=true
fi

if [ "$QUIT" = true ]; then
	exit
fi

echo "Creating .vim folder"
mkdir $TARGET_VIM_HOME_FOLDER

echo "Linking .vimrc $PROJECT_VIMRC to $TARGET_VIMRC"
ln -s "$PROJECT_VIMRC" "$TARGET_VIMRC"

echo "Linking .nvimrc $PROJECT_NVIMRC to $TARGET_NVIMRC"
ln -s "$PROJECT_VIMRC" "$TARGET_NVIMRC"

echo "Linking .nvim $TARGET_NVIM_HOME_FOLDER to $TARGET_VIM_HOME_FOLDER"
ln -s "$TARGET_VIM_HOME_FOLDER" "$TARGET_NVIM_HOME_FOLDER"

echo "Downloading and installing vimplug"
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


#Install support for neovim
pip install neovim

