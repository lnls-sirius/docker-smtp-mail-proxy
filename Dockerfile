#
# Docker image for SMTP mail proxy
#
# Author: Aureo Freitas
# LNLS - Brazilian Synchrotron Light Source Laboratory
#

FROM python:latest

MAINTAINER Aureo Freitas <aureo.carneiro@gmail.com>

# Github environment variables
ENV GITHUB_MAIL_REPO https://github.com/kz26/mailproxy.git
ENV GITHUB_MAIL_BRANCH master

# Mail proxy operation variables
ENV MAIL_FOLDER /opt/lnls-mail-proxy-server
ENV MAIL_VERSION mail-proxy-server-1.0

# Update image and install requires packages
RUN pip install aiosmtpd asyncio

# Create folders
RUN mkdir -p ${MAIL_FOLDER}/${MAIL_VERSION}/scripts

# Create new folder and copy all scripts
RUN mkdir -p ${MAIL_FOLDER}/build/scripts/

COPY scripts/setup-mail-proxy.sh ${MAIL_FOLDER}/build/scripts/

# Clone and compile alarm source code
RUN ${MAIL_FOLDER}/build/scripts/setup-mail-proxy.sh

# Copy provided configuration file
COPY configuration/config.ini ${MAIL_FOLDER}/${MAIL_VERSION}/configuration/

COPY scripts/start-mail-proxy.sh ${MAIL_FOLDER}/${MAIL_VERSION}/scripts/

CMD ["sh", "-c", "${MAIL_FOLDER}/${MAIL_VERSION}/scripts/start-mail-proxy.sh"]
