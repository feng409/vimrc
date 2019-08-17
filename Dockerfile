FROM ubuntu_updated

WORKDIR /root

ADD . /root/.vim

RUN apt-get update \
    && apt-get install -y \
                      git \
                      vim \
                      ctags \
                      silversearcher-ag \
                      ack \
                      python3-dev \
                      cmake \
                      build-essential \
 					  golang-go
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \

RUN git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git Vundle.vim \
	&& mv Vundle.vim /root/.vim/bundle/Vundle.vim \
	&& sed -i "s/git clone/git clone --depth 1/" /root/.vim/bundle/Vundle.vim/autoload/vundle/installer.vim \
	&& ln -s /root/.vim/vimrc /root/.vimrc \
	&& vim +PluginInstall +qall  \
    && cd /root/.vim/bundle/YouCompleteMe \
	&& python3 install.py --clang-completer


