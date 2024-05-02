#!/bin/sh 

############################################
##### INSTALL A MODERN IDE FOR DEBUG #######
############################################
{
  echo "INFO: Downloading NeoVim"
  nvim_link="https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz"
  wget ${nvim_link} -O nvim.tar.gz
  echo "INFO: Decompressing NeoVim binaries and deleting comppressed file"
  tar -xzvf nvim.tar.gz 
  rm -rf nvim.tar.gz
  echo "INFO: Moving binaries to opt folder, and linking them"
  mv nvim-linux64 /opt
  mv /opt/nvim-linux64 /opt/nvim
  ln -sf /opt/nvim/bin/nvim /usr/bin/nvim
} || {
  echo "ERROR: Couldn't download, decompress, remove compressed or link to path the NeoVim binaries" >&2
  exit 1
}
{
  echo "INFO: Installing NvChad IDE"
  git clone https://github.com/NvChad/starter ~/.config/nvim 
  nvim & 
} || {
  echo "ERROR: Couldn't install the IDE NvChad, check the internet 
  connection" >&2
  exit 1
}

