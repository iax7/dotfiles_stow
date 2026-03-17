#!/usr/bin/env bash
RST="\e[0m"
RED="\e[31m"
BLU="\e[34m"
title() { echo -e "$RED--$RST $BLU${@}$RST $RED--$RST"; }
cmd_exist() { command -v "$1" &> /dev/null; }

if cmd_exist apt; then
  title "Installing packages for small-rc"
  sudo apt-get update
  # Outdated packages: bat eza fd-find fzf ripgrep git-delta zoxide
  apps=(btop git zsh vim tmux jq stow)
  sudo apt install -y ${apps[@]}
fi

# install Mise
title Installing Mise
if ! cmd_exist mise; then
  curl https://mise.run | sh
  mise install
fi

title "🔗 Creating symlinks..."
src="$HOME/.zshrc"
[[ -f "$src" && ! -L "$src" ]] && mv -v "$src" "$src.bkp"
stow -v small-rc

if cmd_exist vim; then
  title "Bootstraping Vim"
  vim '+PlugUpdate' '+PlugClean!' '+PlugUpdate' '+qall'
fi
