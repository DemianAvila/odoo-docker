#####################################################################
### ** Dockerfile to deploy a Odoo v17 ans Postgresql        **   ###
### Author:         Demian Avila - Inntegra                       ###
### Email:          davila@inntegra.tech                          ###
### Description:    Dockerfile to build and deploy an Odoo v17    ###
###                 with a posgres server, this, for language     ###
###                 server purposes and to debug                  ###
### Date:           2024-03-29                                    ###
### Version:        1.0                                           ###
### Encoding:       UTF-8                                         ###
### Dependencies:   Docker version 25                             ###
#####################################################################

FROM        debian:12
WORKDIR     /scripts

#####################################################################
################### INSTALL DEV TOOLS BY STAGE ######################
#####################################################################
COPY        ./docker-server-development/scripts/install-dev-tools_stage1.sh .
RUN         sh ./install-dev-tools_stage1.sh
COPY        ./docker-server-development/scripts/install-dev-tools_stage2.sh .
RUN         sh ./install-dev-tools_stage2.sh
COPY        ./docker-server-development/scripts/install-dev-tools_stage3.sh .
RUN         sh ./install-dev-tools_stage3.sh
COPY        ./docker-server-development/scripts/install-dev-tools_stage4.sh .
RUN         sh ./install-dev-tools_stage4.sh

#####################################################################
################# INSTALL ODOO AND PSQL BY STAGE ####################
#####################################################################
COPY        ./docker-server-development/scripts/install-odoo-17_stage1.sh .
RUN         sh ./install-odoo-17_stage1.sh
COPY        ./docker-server-development/scripts/install-odoo-17_stage2.sh .
RUN         sh ./install-odoo-17_stage2.sh
COPY        ./docker-server-development/scripts/install-odoo-17_stage3.sh .
RUN         sh ./install-odoo-17_stage3.sh
WORKDIR     /opt
COPY        ./docker-server-development/scripts/install-odoo-17_stage4.sh .
RUN         sh ./install-odoo-17_stage4.sh
WORKDIR     /opt/odoo 
COPY        ./docker-server-development/scripts/install-odoo-17_stage5.sh .
RUN         sh ./install-odoo-17_stage5.sh

#####################################################################
###################### COPY CONFIG FILES ############################
#####################################################################
WORKDIR     /static
COPY        ./docker-server-development/static/ .

#####################################################################
######################### RUN SERVICES ##############################
#####################################################################
WORKDIR     /app
COPY        ./docker-server-development/scripts/run-binaries.sh .
CMD         sh ./run-binaries.sh && tail -f /dev/nulls