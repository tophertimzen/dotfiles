#!/bin/bash

# download Vundle files
if [ ! -d ~/.vim/bundle ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
fi

if [ ! -d ~/.oh-my-zsh ];then
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

cp zsh/themes/topher.zsh-theme ~/.oh-my-zsh/themes/

for dotfile in $(ls); do stow $dotfile; done

echo "[+] Installing YouCompleteMe and vim plugins. This will might take a while."
vim +PluginInstall +qall
