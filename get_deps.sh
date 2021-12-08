#!/usr/bin/env bash

set -eu

sudo zypper install -y git gcc11-c++ cmake libacl-devel tinyxml2-devel opencv-devel patch liblog4cxx-devel python3-qt5-devel asio-devel libeigen3-devel bison libXaw-devel libcurl-devel python3-sip4-devel freetype2-devel libbullet-devel
sudo update-alternatives --remove-all gcc || true
sudo update-alternatives --remove-all g++ || true
sudo update-alternatives --install /usr/bin/gcc gcc "$(which gcc-11)" 10
sudo update-alternatives --install /usr/bin/g++ g++ "$(which g++-11)" 10

# EOF
