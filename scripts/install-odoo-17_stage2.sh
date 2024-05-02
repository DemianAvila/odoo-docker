#!/bin/sh 

##########################################################
################## CONFIGURE NODE ########################
##########################################################
{
    echo "INFO: Create node symbolic link"
    ln -s /usr/bin/nodejs /usr/bin/node
    echo "INFO: Install other node tools"
    npm install -g less less-plugin-clean-css
    apt install -y node-less
} || {
    echo "ERROR: Error while configuring node and npm, check sublog" >&2 
    exit 1 
}

