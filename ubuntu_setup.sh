#! bin/bash

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

apt_array=(\
	curl \
	wget \
	git \
	vim \
	zsh \
	openssl \
	libssl-dev \
	openssh-server \
	make \
	cmake \
	build-essential \
	gcc \
	binutils \ 
	libc6-dev \
	llvm \
	libboost-all-dev \
	libeigen3-dev \
	libsuitsparse-dev \
	libfreeimage-dev \
	libgoogle-glog-dev \
	libgflags-dev \
	# opencv
	libopencv-dev \
	# gl
	freeglut3 freeglut3-dev libglew-dev \
	# qt
	qtbase5-dev qttools5-dev-tools qt5-default \
	net-tools \
	exfat-fuse \
	exfat-utils \
	# assimp : to import various well-known 3D model formats
	assimp-utils libassimp-dev
)

yes | sudo apt-get update
yes | sudo apt-get upgrade

# install by apt-get
for e in ${apt_array[@]}; do
	yes | sudo apt-get install ${e}
done

# google chrome
# curl https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
# echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/
# google-chrome.list
# sudo apt update
# sudo apt install google-chrome-stable
