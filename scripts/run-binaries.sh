#!/bin/sh 

##########################################################
################ INIT POSTGRES SERVICE ###################
##########################################################
{
    echo "INFO: Starting postgres"
    service postgresql start
} ||
{
    echo "ERROR: Error while staring postgresql server, check sublog" >&2 
    exit 1 
}

##########################################################
################ CREATE PSQL ODOO USER ###################
##########################################################
{
    echo "INFO: Creating a posrgres user for odoo consumption"
    chmod 777 -R /static
    su postgres -c "psql -f /static/create_user.sql"
} || {
    echo "ERROR: Error while creating postgresql user, check sublog" >&2 
    exit 1
}

##########################################################
###################### ODOO INIT #########################
##########################################################
{ 
    mv /static/odoo  /etc/init.d
    service odoo start 
    . /static/reload_on_module_change.sh &
    tail -f /dev/null
} || {
    echo "ERROR: Error at odoo initialization, check sublog" >&2 
    exit 1
}
