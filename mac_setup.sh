#!/bin/bash

usage ()
{
	local script_name=$(basename "$0")
	cat << END
Usage: $script_name ENV
Setup and install base applications.

	ENV		current environment.

Examples:
	$script_name waseda
END
}

# if number of option is 0, run usage().
if [ "$#" -eq 0 ]; then
	usage
	exit １
fi

ENV="vanilla"

#proxy
if [ $1 = "waseda" ]; then
	ENV="waseda"
	PROXY="www-proxy.waseda.jp"
	PORT="8080"
fi

if [ $ENV != "vanilla" ]; then
	echo "proxy env: ${ENV}"
	export http_proxy=http://${PROXY}:${PORT}
	export https_proxy=$http_proxy
	export ALL_PROXY=$http_proxy
fi
  

#homebrew
yes | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update

brew_array=(\
		binutils \
		docker \
		docker-compose \
		docker-machine \
		gcc \
		git \
		graphviz \
		make \
		spatialindex \
		wget \
		yarn \
		zsh \
		zsh-completions \
)

cask_array=(\
		docker \
		iterm2 \
		google-chrome \
		meshlab \
		miniconda \
		slack \
		skype \
		visual-studio-code \
)

# install by homebrew
for e in ${brew_array[@]}; do
	brew install ${e}
done

# install by homebrew cask
for e in ${cask_array[@]}; do
	brew cask install ${e}
done

# change screenshot dir
mkdir ~/Temp
defaults write com.apple.screencapture location ~/Temp/;killall SystemUIServer