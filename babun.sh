#!/bin/bash

pact install stow cmake perl

# fix stow perk path for stow https://github.com/babun/babun/issues/490
cd /usr/lib/perl5/vendor_perl/5.14
ln -s ../5.22/Stow && ln -s ../5.22/Stow.pm
cp bash/.minttyrc ~/.
rm ~/.zshrc
touch ~/.alias
touch ~/.exploits
touch ~/.cygwinAlias
