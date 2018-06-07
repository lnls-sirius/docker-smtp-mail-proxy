#!/bin/bash

ls ${MAIL_FOLDER}/${MAIL_VERSION}/scripts
ls ${MAIL_FOLDER}/${MAIL_VERSION}/configuration

IP_ADDRESS=$(getent hosts mail-proxy | awk '{ print $1 }')

sed -i "2s:.*:host = ${IP_ADDRESS}:" ${MAIL_FOLDER}/${MAIL_VERSION}/configuration/config.ini

cat ${MAIL_FOLDER}/${MAIL_VERSION}/configuration/config.ini

python -u ${MAIL_FOLDER}/${MAIL_VERSION}/scripts/mailproxy.py ${MAIL_FOLDER}/${MAIL_VERSION}/configuration/config.ini
