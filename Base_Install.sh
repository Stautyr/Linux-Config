#!/bin/bash

# Base Updates
sudo apt-get update
sudo apt-get upgrade -y

# Nvim Install
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -C /opt -xzf nvim-linux64.tar.gz
echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc
source ~/.bashrc
cp -r nvim/ ~/.config/
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

nvim ~/.config/nvim/lua/theprimeagen/packer.lua
