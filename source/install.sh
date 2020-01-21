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

sh install_vim.sh
sh install_powerline_shell.sh
source .bash_profile

printf "\e[32m✔\e[0m dotfiles installed successfully!
Restart your terminal session...\n"
