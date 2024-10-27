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



current_dir=$(pwd)
mkdir -p ~/work/collabora

#libreoffice 24
cd ~/work/collabora && \
git clone -b distro/collabora/co-24.04 "https://git.libreoffice.org/core" libreoffice_2024 && cd "libreoffice_2024" && (mkdir -p `git rev-parse --git-dir`/hooks/ && curl -Lo `git rev-parse --git-dir`/hooks/commit-msg https://gerrit.libreoffice.org/tools/hooks/commit-msg && chmod +x `git rev-parse --git-dir`/hooks/commit-msg) && git clone -b distro/collabora/co-24.04 --depth=1 https://git.libreoffice.org/translations && ./autogen.sh --enable-dbgutil --enable-python=internal --with-lang=ALL --enable-werror --without-system-nss && \
cp $current_dir/vscode_core/* .vscode && make

#online master
cd ~/work/collabora && \
git clone https://github.com/lpranam/online.git online_master && cd online_master && git remote add upstream https://github.com/CollaboraOnline/online.git && ./autogen.sh && ./configure --enable-debug --enable-silent-rules --enable-cypress --disable-ssl --enable-feature-lock --enable-feature-restriction --disable-werror --with-lokit-path=~/work/collabora/libreoffice_2024/include --with-lo-path=~/work/collabora/libreoffice_2024/instdir --with-logfile=/tmp/coolwsd_master.log && \
cp -R $current_dir/vscode_online .vscode

#libreoffice master
cd ~/work/collabora && \
git clone "https://git.libreoffice.org/core" libreoffice_master && cd "libreoffice_master" && (mkdir -p `git rev-parse --git-dir`/hooks/ && curl -Lo `git rev-parse --git-dir`/hooks/commit-msg https://gerrit.libreoffice.org/tools/hooks/commit-msg && chmod +x `git rev-parse --git-dir`/hooks/commit-msg) && git clone -b distro/collabora/co-24.04 --depth=1 https://git.libreoffice.org/translations && ./autogen.sh --enable-dbgutil --enable-python=internal --with-lang=ALL --enable-werror --without-system-nss && \
cp $current_dir/vscode_core/* .vscode && make

#libreoffice 23
cd ~/work/collabora && \
git clone -b distro/collabora/co-23.05 "https://git.libreoffice.org/core" libreoffice_2023 && cd "libreoffice_2023" && (mkdir -p `git rev-parse --git-dir`/hooks/ && curl -Lo `git rev-parse --git-dir`/hooks/commit-msg https://gerrit.libreoffice.org/tools/hooks/commit-msg && chmod +x `git rev-parse --git-dir`/hooks/commit-msg) && git clone -b distro/collabora/co-24.04 --depth=1 https://git.libreoffice.org/translations && ./autogen.sh --enable-dbgutil --enable-python=internal --with-lang=ALL --enable-werror --without-system-nss && \
cp $current_dir/vscode_core/* .vscode/ && make 

#online 23
cd ~/work/collabora && \
git clone -b distro/collabora/co-23.05 https://github.com/lpranam/online.git online_2023 && cd online_2023 && git remote add upstream https://github.com/CollaboraOnline/online.git && ./autogen.sh && ./configure --enable-debug --enable-silent-rules --enable-cypress --disable-ssl --enable-feature-lock --enable-feature-restriction --disable-werror --with-lokit-path=~/work/collabora/libreoffice_2023/include --with-lo-path=~/work/collabora/libreoffice_2023/instdir --with-logfile=/tmp/coolwsd_2023.log && \
cp -R $current_dir/vscode_online .vscode && \
sed -i -e 's/libreoffice_2024/libreoffice_2023/g' .vscode/c_cpp_properties.json



