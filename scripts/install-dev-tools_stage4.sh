#!/bin/sh 

############################################
#### INSTALL A MODERN SHELL FOR DEBUG ######
############################################
{
  echo "INFO: Installing OhMyZSH"
  sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" \
  -t "agnoster"
} || {
  echo "ERROR: Couldn't either download or install OhMyZSH" >&2
  exit 1
}

echo "INFO: Development packages instalation ended correctly"
