#!/bin/bash

ls ${MAIL_FOLDER}/${MAIL_VERSION}/scripts
ls ${MAIL_FOLDER}/${MAIL_VERSION}/configuration
python -u ${MAIL_FOLDER}/${MAIL_VERSION}/scripts/mailproxy.py ${MAIL_FOLDER}/${MAIL_VERSION}/configuration/config.ini
