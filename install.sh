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

# install plugin by vundle
git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim  

# alter git clone just for depth 1
sed -i "s/git clone/git clone --depth 1/" $HOME/.vim/bundle/Vundle.vim/autoload/vundle/installer.vim 

# source vim
mv $HOME/.vimrc $HOME/.vimrc.bak
ln -s $HOME/.vim/vimrc $HOME/.vimrc 

vim +PluginInstall +qall

# install YouCompleteMe
cd $HOME/.vim/bundle/YouCompleteMe \
	&& $python install.py --clang-completer
