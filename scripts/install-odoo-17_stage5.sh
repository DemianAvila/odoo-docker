#!/bin/sh 

##########################################################
############ INSTALLING PYTHON REQUIREMENTS ##############
##########################################################
{
    echo "INFO: Installing python requirements"
    python3 -m pip config set global.break-system-packages true
    pip3 install -r ./requirements.txt
    echo "INFO: Installing wkhtmltopdf"
    wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
    dpkg -i wkhtmltox_0.12.5-1.bionic_amd64.deb
    apt install -fy
} || {
    echo "ERROR: Couldn't install python dependencies, check pip log" >&2 
    exit 1 
}