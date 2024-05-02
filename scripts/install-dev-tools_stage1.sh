#!/bin/sh 

##########################################
############ UPDATE PACKAGES #############
##########################################
{
  echo "INFO: Build started"
  echo "INFO: Updating packages"
  apt update -y 
  apt upgrade -y

} || {
  echo "ERROR: Couldn't update packages, check your internet
connection or if Debian repositories are accesible" >&2 
  exit 1 
}