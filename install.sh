for dotfile in $(ls); do stow $dotfile; done

echo "[+] Installing YouCompleteMe and vim plugins. This will might take a while."
vim +PluginInstall +qall
