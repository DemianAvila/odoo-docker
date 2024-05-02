#!/bin/sh 

##########################################################
################## CLONING ODOO 17 #######################
##########################################################
{
    echo "INFO: Clone Odoo v17 from source"
    git clone https://www.github.com/odoo/odoo --depth 1 --branch 17.0 --single-branch 
} || {
    echo "ERROR: Couldn't clone odoo, check git log" >&2 
    exit 1 
}