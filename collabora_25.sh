current_dir=$(pwd)

#libreoffice 25
cd ~/work/collabora && \
git clone -b distro/collabora/co-25.04 "https://git.libreoffice.org/core" libreoffice_2025 && cd "libreoffice_2025" && (mkdir -p `git rev-parse --git-dir`/hooks/ && curl -Lo `git rev-parse --git-dir`/hooks/commit-msg https://gerrit.libreoffice.org/tools/hooks/commit-msg && chmod +x `git rev-parse --git-dir`/hooks/commit-msg) && ./autogen.sh --enable-dbgutil --enable-python=internal --enable-werror --without-system-nss && \
cp $current_dir/vscode_core/* .vscode/ && make

#online 25
cd ~/work/collabora && \
git clone https://github.com/lpranam/online.git online_2025 && cd online_2025 && git remote add upstream https://github.com/CollaboraOnline/online.git && ./autogen.sh && ./configure --enable-debug --enable-silent-rules --enable-cypress --disable-ssl --enable-feature-lock --enable-feature-restriction --disable-werror --with-lokit-path=$HOME/work/collabora/libreoffice_2025/include --with-lo-path=$HOME/work/collabora/libreoffice_2025/instdir --with-logfile=/tmp/coolwsd_2025.log && \
cp -R $current_dir/vscode_online .vscode && \
sed -i -e 's/libreoffice_2024/libreoffice_2025/g' .vscode/c_cpp_properties.json
