#!/bin/bash

echo "[+] Installing Topher's dotfiles"

#copy and backup dot files
if [ ! -d ~/.dotfileBackups/$(date "+%F") ]; then
    echo "[+] Backing up dotfiles"
    mkdir -p ~/.dotfileBackups/$(date "+%F")/
    mkdir -p ~/.vim
    mv ~/.alias ~/.dotfileBackups/$(date "+%F")/
    mv ~/.vimrc ~/.dotfileBackups/$(date "+%F")/
    mv ~/.vim ~/.dotfileBackups/$(date "+%F")/
    mv ~/.zshrc ~/.dotfileBackups/$(date "+%F")/
    echo "[+] Installing new dotfiles"
    cp .alias ~/.alias
    cp vim/.vimrc ~/.vimrc
    cp -r vim/.vim ~/.vim
    cp .exploits ~/.exploits
    cp .gitconfig ~/.gitconfig
fi


#check if babun 
if [ -d /cygdrive/ ]; then
    echo "[+] Cygwin/Babun detected"
    echo "[+] Installing mintty and cygwinAlias"
    mv ~/.minttyrc ~/.dotfileBackups/$(date "+%F")/
    cp .minttyrc ~/.minttyrc
    cp .cygwinAlias ~/.cygwinAlias
else 
    echo "[+] Installing dark solarized theme for GNOME"

    if [[ ! -z $(which yum) ]]; then
        yum install -y gconf2
        yum install gnome-terminal
    elif [[ ! -z $(which apt-get) ]]; then
        apt-get install gnome-terminal
        apt-get install gconf2
    fi


    git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
    cd gnome-terminal-colors-solarized
    ./set_dark.sh
    cd ..
   
    if [[ ! -d ~/.vim/bundle/vundle ]]; then
        echo "[+] Installing vundle"
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi
fi

#Install oh-my-zsh and zsh if not already
if [[ ! -z $(which yum) ]]; then
    yum install -y zsh
elif [[ ! -z $(which apt-get) ]]; then
    apt-get install -y zsh
fi

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

#Install Topher's ZSH theme
echo "[+] Adding Topher's zshrc and zsh theme"
cp .zshrc ~/.zshrc
cp topher.zsh-theme ~/.oh-my-zsh/themes/
    
if [[ ! -d /cygdrive/ ]]; then
    echo "[+] Installing YouCompleteMe and vim plugins. This will might take a while."
    vim +PluginInstall +qall
    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer
fi
