FROM chemf/vim

RUN apt-get update \
	&& apt-get install -y cmake ctags \
	&& echo python3 | sh -c "$(curl -fsSL https://github.com/feng409/vimrc/raw/master/install.sh)" \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 
