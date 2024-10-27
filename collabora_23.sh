current_dir=$(pwd)

#libreoffice 23
cd ~/work/collabora && \
git clone -b distro/collabora/co-23.05 "https://git.libreoffice.org/core" libreoffice_2023 && cd "libreoffice_2023" && (mkdir -p `git rev-parse --git-dir`/hooks/ && curl -Lo `git rev-parse --git-dir`/hooks/commit-msg https://gerrit.libreoffice.org/tools/hooks/commit-msg && chmod +x `git rev-parse --git-dir`/hooks/commit-msg) && git clone -b distro/collabora/co-24.04 --depth=1 https://git.libreoffice.org/translations && ./autogen.sh --enable-dbgutil --enable-python=internal --with-lang=ALL --enable-werror --without-system-nss && \
cp $current_dir/vscode_core/* .vscode/ && make

#online 23
cd ~/work/collabora && \
git clone -b distro/collabora/co-23.05 https://github.com/lpranam/online.git online_2023 && cd online_2023 && git remote add upstream https://github.com/CollaboraOnline/online.git && ./autogen.sh && ./configure --enable-debug --enable-silent-rules --enable-cypress --disable-ssl --enable-feature-lock --enable-feature-restriction --disable-werror --with-lokit-path=~/work/collabora/libreoffice_2023/include --with-lo-path=~/work/collabora/libreoffice_2023/instdir --with-logfile=/tmp/coolwsd_2023.log && \
cp -R $current_dir/vscode_online .vscode && \
sed -i -e 's/libreoffice_2024/libreoffice_2023/g' .vscode/c_cpp_properties.json
