current_dir=$(pwd)

#libreoffice master
cd ~/work/collabora && \
git clone "https://git.libreoffice.org/core" libreoffice_master && cd "libreoffice_master" && (mkdir -p `git rev-parse --git-dir`/hooks/ && curl -Lo `git rev-parse --git-dir`/hooks/commit-msg https://gerrit.libreoffice.org/tools/hooks/commit-msg && chmod +x `git rev-parse --git-dir`/hooks/commit-msg) && git clone -b distro/collabora/co-24.04 --depth=1 https://git.libreoffice.org/translations && ./autogen.sh --enable-dbgutil --enable-python=internal --with-lang=ALL --enable-werror --without-system-nss && \
cp $current_dir/vscode_core/* .vscode && make
