#!/bin/bash

date=$(date +%Y%M%d%HI%S)
backdir=$HOME/vimbackup_$date
echo "**** backup .vim and .vimrc to $backdir ***"

if [ ! -e $backdir ]; then
    mkdir $backdir
fi

if [ -e $HOME/.vimrc ]; then
    mv $HOME/.vimrc $backdir
fi

if [ -L $HOME/.vimrc ]; then
    echo 'link'
    unlink $HOME/.vimrc
fi

if [ -e $HOME/.vim ]; then
    mv $HOME/.vim $backdir
fi

echo "**** begin to deploy vim environment ***"
mkdir -p $HOME/.vim/bundle
mkdir $HOME/.vim/backupdir
mkdir $HOME/.vim/undodir

mv `dirname $0`/.vimrc $HOME/.vim/.vimrc
ln -s $HOME/.vim/.vimrc $HOME/.vimrc

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
