#!/bin/bash

mkdir -p $HOME/GIT

git clone --recursive https://github.com/rodrigogolive/dotfiles.git $HOME/GIT/dotfiles
#git clone --recursive -b DOCKER https://github.com/rodrigogolive/dotfiles.git $HOME/GIT/dotfiles
#sh $HOME/GIT/dotfiles/.install

git clone --recursive https://github.com/rodrigogolive/dotbins.git $HOME/GIT/dotbins
# link things
