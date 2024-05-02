#!/bin/sh 

##########################################################
############# INSTALL OTHER DEV TOOLS ####################
##########################################################
{
    echo "INFO: Trying to install other developer tools"
    apt install -y python-dev-is-python3 python3-dev libxml2-dev libxslt1-dev \
    zlib1g-dev libsasl2-dev libldap2-dev build-essential libssl-dev \
    libffi-dev libmariadb-dev-compat libmariadb-dev libpq-dev \
    libjpeg62-turbo-dev liblcms2-dev libblas-dev libatlas-base-dev \
    npm 
} || {
    echo "ERROR: Error while installing packages, check sublog" >&2 
    exit 1 
}

