#!/usr/bin/env bash

if [[ "$PWD" != "$HOME/dotfiles/" ]]; then
  cp -pr ./ "$HOME/dotfiles/"
fi

bash_profile="$HOME/.bash_profile"

if [ -f "$bash_profile" ]; then
  mv $bash_profile "$bash_profile.bkp"
elif [ -L "$bash_profile" ]; then
  rm -f $bash_profile
fi
ln -s "$HOME/dotfiles/.bash_profile" $bash_profile

vimrc="$HOME/.vimrc"
if [ -f "$vimrc" ]; then
  mv $vimrc "$vimrc.bkp"
elif [ -L "$bash_profile" ]; then
  rm -f $vimrc
fi
ln -s "$HOME/dotfiles/.vimrc" $vimrc

source .bash_profile

printf "\e[32m✔\e[0m dotfiles installed successfully!
Restart your terminal session...\n"
