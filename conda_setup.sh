#!/bin/zsh

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

DEFAULT="nao"

source ~/.zprofile
conda activate ${DEFAULT} 
conda info -e
