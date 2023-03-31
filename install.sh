#/usr/bin/env bash
# install common dependency
echo -n "choose python version command to compile YouCompleteMe (python2|python3): "
read python

source /etc/os-release

case $ID in
debian|ubuntu)
	sudo apt-get install -y \
		git \
		vim \
		ctags \
		cmake \
		ack \
		build-essential \
		python3-dev
	;;
centos|amaz|fedora|rhel)
	sudo yum install -y \
		git \
		vim \
		ctags \
		cmake \
		ack 
	;;
*)
	;;
esac

# clone thie repo
git clone --depth 1 https://github.com/feng409/vimrc.git $HOME/.vim

# install plugin by plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# source vim
mv $HOME/.vimrc $HOME/.vimrc.bak
ln -s $HOME/.vim/vimrc $HOME/.vimrc 

vim +PlugInstall +quitall

# install coc
cd $HOME/.vim/plugged/coc.nvim && yarn install
