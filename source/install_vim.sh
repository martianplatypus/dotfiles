#!/usr/bin/env bash

vimrc="$HOME/.vimrc"
if [ -L "$vimrc" ]; then
  rm -f $vimrc
elif [ -f "$vimrc" ]; then
  mv $vimrc "$vimrc.bkp"
fi
cp -p .vimrc "$HOME/dotfiles/.vimrc"
ln -s "$HOME/dotfiles/.vimrc" $vimrc

vim_dir="$HOME/.vim"
if [ -L "$vim_dir" ]; then
  rm -f "$vim_dir"
elif [ -d "$vim_dir" ]; then
  mv "$vim_dir" "$HOME/.vim.bkp"
fi

if [ ! -d "$HOME/dotfiles/.vim" ]; then
  mkdir -p "$HOME/dotfiles/.vim"
fi

mkdir -p tmp

if curl -LSso tmp/pathogen.vim https://tpo.pe/pathogen.vim; then
  mkdir -p "$HOME/dotfiles/.vim/autoload"
  mkdir -p "$HOME/dotfiles/.vim/bundle"
  cp -p tmp/pathogen.vim "$HOME/dotfiles/.vim/autoload"
  sed -i '' "1i\\
  execute pathogen#infect()

  " $HOME/dotfiles/.vimrc
  rm -f tmp/pathogen.vim
fi

if git clone https://github.com/tomasr/molokai.git tmp/molokai; then
  mkdir -p "$HOME/dotfiles/.vim/colors"
  cp -p tmp/molokai/colors/molokai.vim "$HOME/dotfiles/.vim/colors/"
  sed -i '' '3i\
  colorscheme molokai
  ' "$HOME/dotfiles/.vimrc"
  rm -rf tmp/molokai/
fi

rm -rf tmp/

ln -s "$HOME/dotfiles/.vim" $vim_dir
printf "\e[32m✔\e[0m vim installed successfully!\n"
