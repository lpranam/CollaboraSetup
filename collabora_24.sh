current_dir=$(pwd)

#libreoffice 24
cd ~/work/collabora && \
git clone -b distro/collabora/co-24.04 "https://git.libreoffice.org/core" libreoffice_2024 && cd "libreoffice_2024" && (mkdir -p `git rev-parse --git-dir`/hooks/ && curl -Lo `git rev-parse --git-dir`/hooks/commit-msg https://gerrit.libreoffice.org/tools/hooks/commit-msg && chmod +x `git rev-parse --git-dir`/hooks/commit-msg) && git clone -b distro/collabora/co-24.04 --depth=1 https://git.libreoffice.org/translations && ./autogen.sh --enable-dbgutil --enable-python=internal --with-lang=ALL --enable-werror --without-system-nss && \
cp $current_dir/vscode_core/* .vscode && make

#online master
cd ~/work/collabora && \
git clone https://github.com/lpranam/online.git online_master && cd online_master && git remote add upstream https://github.com/CollaboraOnline/online.git && ./autogen.sh && ./configure --enable-debug --enable-silent-rules --enable-cypress --disable-ssl --enable-feature-lock --enable-feature-restriction --disable-werror --with-lokit-path=~/work/collabora/libreoffice_2024/include --with-lo-path=~/work/collabora/libreoffice_2024/instdir --with-logfile=/tmp/coolwsd_master.log && \
cp -R $current_dir/vscode_online .vscode
