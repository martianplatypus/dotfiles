#!/usr/bin/env bash

if gdircolors_cmd="$(type -p gdircolors)" && [ ! -z $gdircolors_cmd ]; then
  if [ ! "$(command -v brew)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  brew install coreutils
fi

if curl -LSso tmp/.dircolors https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS; then
  cp -p tmp/.dircolors "$HOME/dotfiles/"
  dircolors_file="$HOME/.dircolors"
  if [ -L "$dircolors_file" ]; then
    rm -f "$dircolors_file"
  elif [ -f "$dircolors_file" ]; then
    mv $dircolors_file $dircolors_file.bkp
    rm -f tmp/.dircolors
  fi
  ln -s "$HOME/dotfiles/.dircolors" $dircolors_file
fi

printf "\e[32m✔\e[0m LS_COLORS installed successfully!\n"
