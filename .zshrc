export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="topher"

export PATH=$HOME/bin:/usr/local/bin:$PATH

source $ZSH/oh-my-zsh.sh
source $HOME/.alias
source $HOME/.exploits

if [[ -a ~/.private ]]; then
    source $HOME/.private
fi

SAVEHIST=1000
HISTFILE=$HOME/.zsh_history

# Base styles and color palette
# Solarized colors
# https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized
BOLD=$(tput bold)
RESET=$(tput sgr0)
SOLAR_YELLOW=$(tput setaf 136)
SOLAR_ORANGE=$(tput setaf 166)
SOLAR_RED=$(tput setaf 124)
SOLAR_MAGENTA=$(tput setaf 125)
SOLAR_VIOLET=$(tput setaf 61)
SOLAR_BLUE=$(tput setaf 33)
SOLAR_CYAN=$(tput setaf 37)
SOLAR_GREEN=$(tput setaf 64)
SOLAR_WHITE=$(tput setaf 254)

if [[ -d /cygdrive/ ==]; then
    source $HOME/.cygwinAlias
fi

#global grep 
gg () {
   grep $1 * -sirn
}

#bash like fg
fg() {
    if [[ $# -eq 1 && $1 = - ]]; then
        builtin fg %-
    else
        builtin fg %"$@"
    fi
}

