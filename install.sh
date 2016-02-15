#!/bin/bash

#Install oh-my-zsh and zsh if not already
if [[ ! -z which yum ]]; then
    yum install zsh
elif [[ ! -z which apt-get ]]; then
    apt-get zsh
fi
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Install Topher's ZSH theme
cp topher.zsh-theme ~/.oh-my-zsh/themes/

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
    cp .zshrc ~/.zshrc
    cp .exploits ~/.exploits
    cp .gitconfig ~/.gitconfig
fi


#check if babun 
if [ -d /cygdrive/ ]; then
    echo "[+] Cygwin/Babun detected"
    echo "[+] Installing mintty and cygwinAlias"
    echo 'source $HOME/.cygwinAlias' >> ~/.zshrc
    mv ~/.minttyrc ~/.dotfileBackups/$(date "+%F")/
    cp .minttyrc ~/.minttyrc
    cp .cygwinAlias ~/.cygwinAlias
else 
    echo "[+] Installing dark solarized theme for GNOME"
    git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
    cd gnome-terminal-colors-solarized
    ./set_dark.sh
    cd ..
fi

