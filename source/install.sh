#!/usr/bin/env bash

cp -pr ./ "$HOME/dotfiles/"

bash_profile="$HOME/.bash_profile"

if [ -f "$bash_profile" ]; then
  mv $bash_profile "$bash_profile.bkp"
elif [ -L "$bash_profile" ]; then
  rm -f $bash_profile
fi

ln -s ./dotfiles/.bash_profile $bash_profile
source .bash_profile

printf "Configuration installed succesfully!\n Restart your session...\n"