#!/usr/bin/env bash

pip install powerline-shell
status=$?
if [ $status -eq 0 ]; then
  cp .bundles/powerline-shell/.powerline-shell.json "$HOME/dotfiles/.powerline-shell.json"

  powerline_json="$HOME/.powerline-shell.json"
  if [ -L "$powerline_json" ]; then
    rm -f "$powerline_json"
  elif [ -f "$powerline_json" ]; then
    mv $powerline_json "$powerline_json".bkp
  fi

  ln -s "$HOME/dotfiles/.powerline-shell.json" $powerline_json

  printf "\e[32m✔\e[0m vim installed successfully!\n"
fi
