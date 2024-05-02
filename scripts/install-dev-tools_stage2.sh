#!/bin/sh 

##########################################
###### INSTALL BASIC DEV PACKAGES ########
##########################################
{
  echo "INFO: Installing development tools"
  apt install git zsh curl wget lsof g++ gcc \
  nodejs ripgrep tmux openssl procps \
  lua5.3 iputils-ping python3-pip inotify-tools -y

} || {
  echo "ERROR: Couldn't install packages, check your internet
connection or if Debian repositories are accesible" >&2 
  exit 1 
}
