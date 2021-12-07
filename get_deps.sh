#!/usr/bin/env bash

set -eu

# work around for missing libIlmImf-2_5-25, https://lwn.net/Articles/867482
sudo rm /etc/zypp/repos.d/home_dirkmueller_Factory.repo
sudo zypper addrepo https://download.opensuse.org/repositories/home:dirkmueller:Factory/standard/home:dirkmueller:Factory.repo
sudo zypper refresh

sudo zypper install -y git gcc11-c++ cmake libacl-devel tinyxml2-devel opencv-devel patch liblog4cxx-devel python3-qt5-devel asio-devel libeigen3-devel bison libXaw-devel libcurl-devel python3-sip4-devel freetype2-devel libbullet-devel
sudo update-alternatives --remove-all gcc || true
sudo update-alternatives --remove-all g++ || true
sudo update-alternatives --install /usr/bin/gcc gcc "$(which gcc-11)" 10
sudo update-alternatives --install /usr/bin/g++ g++ "$(which g++-11)" 10

# EOF
