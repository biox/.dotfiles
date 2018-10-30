#!/bin/bash

echo "Downloading Git repository!" 

mkdir /home/$(whoami)/JESSE_DOTFILES

git clone "https://github.com/biox/dotfiles" /home/$(whoami)/JESSE_DOTFILES

cd /home/$(whoami)/JESSE_DOTFILES

stow
