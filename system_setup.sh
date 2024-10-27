#!/bin/bash
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USER
sudo apt update
sudo apt upgrade
sudo apt autoremove
sudo apt install -y dialog
sudo apt -y one two three four five six sixinstall git build-essential zip ccache junit4 libkrb5-dev nasm graphviz python3 python3-dev qtbase5-dev libkf5coreaddons-dev libkf5i18n-dev libkf5config-dev libkf5windowsystem-dev libkf5kio-dev libqt5x11extras5-dev autoconf libcups2-dev libfontconfig1-dev gperf openjdk-17-jdk doxygen libxslt1-dev xsltproc libxml2-utils libxrandr-dev libx11-dev bison flex libgtk-3-dev libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev ant ant-optional libnss3-dev libavahi-client-dev libxt-dev curl clang-format libpoco-dev python3-polib libcap-dev npm libpam-dev libzstd-dev wget libtool libcap2-bin python3-lxml libpng-dev libcppunit-dev pkg-config fontconfig snapd pulseaudio-utils docker.io libgif-dev podman python3-setuptools chromium

sudo cp images/jarvis_wallpaper.jpg images/collabora_wallpaper.jpg images/left.jpg images/right.jpg /usr/share/wallpapers/
sudo cp images/collabora_symbol.png /usr/share/notificationhelper/
sudo cp sounds/build_failed.ogg sounds/build_complete.ogg /usr/share/sounds/
sudo cp collabora-update /usr/local/bin/
sudo chmod 777 /usr/local/bin/collabora-update

ccache --max-size 32G
echo "export CCACHE_COMPRESS=1" >>  ~/.bashrc
echo "add-auto-load-safe-path /" >> ~/.gdbinit
echo "add-auto-load-safe-path /" | sudo tee /etc/gdb/gdbinit
git config --global user.name 'Pranam Lashkari'
git config --global user.email 'lpranam@collabora.com'
git config --global grep.lineNumber true

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker pull nextcloud
docker run -d -p 80:80 --name cloud nextcloud
docker stop cloud

mkdir -p ~/work/collabora




