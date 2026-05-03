current_dir=$(pwd)

#Online mono repo
cd ~/work/collabora/jail/repos/ && \
git clone "ssh://lpranam@gerrit.collaboraoffice.com:29418/online" online_main && \
(cd "online_main" && mkdir -p `git rev-parse --git-dir`/hooks/ && curl -fLo `git rev-parse --git-dir`/hooks/commit-msg https://gerrit.collaboraoffice.com/tools/hooks/commit-msg && chmod +x `git rev-parse --git-dir`/hooks/commit-msg) && \
cd engine && \
./autogen.sh --enable-dbgutil && \
make &&  \
cd .. && \
./autogen.sh && \
./configure --enable-debug --enable-silent-rules --enable-cypress --disable-werror --with-lokit-path=/home/lpranam/work/collabora/jail/repos/online_main/engine/include --with-lo-path=/home/lpranam/work/collabora/jail/repos/online_main/engine/instdir --with-logfile=/tmp/coolwsd_main.log 'CFLAGS=-O0 -ggdb' 'CXXFLAGS=-O0 -ggdb' && \
make -j && \
cp $current_dir/vscode/* .vscode/


sed -i -e 's/libreoffice_2024/libreoffice_2025/g' .vscode/c_cpp_properties.json
