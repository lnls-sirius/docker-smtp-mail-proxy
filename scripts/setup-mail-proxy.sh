#!/bin/sh

#
# A script to clone and build the smtp mail proxy application.
#
# Aureo Freitas
# Controls Group - Brazilian Synchrotron Light Source Laboratory
#

git clone --branch=${GITHUB_MAIL_BRANCH} ${GITHUB_MAIL_REPO} ${MAIL_FOLDER}/${MAIL_VERSION}/scripts



