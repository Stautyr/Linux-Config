#!/bin/bash

# Base Updates
sudo apt-get update
sudo apt-get upgrade -y

#Curl Check
curl -v 2>/dev/null
if [ -n $? ];then
  echo "Curl NOT INSTALLED"
  sudo apt install curl
fi



# Nvim Install
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
echo 'alias nvim="/opt/nvim-linux-x86_64/bin/nvim"' >> $HOME/.bash_aliases
cp -r nvim/ $HOME/.config/
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/DejaVuSansMono.zip
unzip DejaVuSansMono.zip
sudo mv *.ttf /usr/share/fonts/

/opt/nvim-linux-x86_64/bin/nvim $HOME/.config/nvim/lua/theprimeagen/packer.lua
