#!/bin/sh 

##########################################################
################# INSTALL DATABASE #######################
##########################################################

{
    echo "INFO: Install psql database"
    apt install -y postgresql postgresql-contrib
} || {
    echo "ERROR: Error while installing psql, check sublog" >&2 
    exit 1 
}