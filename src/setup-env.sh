#!/bin/bash
source "$(dirname "$0")/setup-profile.sh"

###
### Setup ENV File
###

if [ ! -f "${CODE_SERVER_CWD}/data/.env" ]
then
  echo "[$(date -u)] Creating ${CODE_SERVER_CWD}/data/.env file..." >> ${CODE_SERVER_LOGS}/setup.log
  touch ${CODE_SERVER_CWD}/data/.env
  echo "# Code Server IDE Configuration" >> ${CODE_SERVER_CWD}/data/.env
  echo "CODE_SERVER_CWD=${CODE_SERVER_CWD}" >> ${CODE_SERVER_CWD}/data/.env
  echo "CODE_SERVER_LOGS=${CODE_SERVER_LOGS}" >> ${CODE_SERVER_CWD}/data/.env
  echo "CODE_SERVER_TRAEFIK=${CODE_SERVER_TRAEFIK}" >> ${CODE_SERVER_CWD}/data/.env
  echo "CODE_SERVER_EMAIL=${CODE_SERVER_EMAIL}" >> ${CODE_SERVER_CWD}/data/.env
  echo "CODE_SERVER_DNS=${CODE_SERVER_DNS:-'$(curl -s -m 0.1 http://169.254.169.254/latest/meta-data/public-hostname)'}" >> ${CODE_SERVER_CWD}/data/.env
  echo "CODE_SERVER_IPv4_LOCAL=${CODE_SERVER_IPv4_LOCAL:-'$(curl -s -m 0.1 http://169.254.169.254/latest/meta-data/local-ipv4)'}" >> ${CODE_SERVER_CWD}/data/.env
  echo "CODE_SERVER_AUTO_START=${CODE_SERVER_AUTO_START:-yes}" >> ${CODE_SERVER_CWD}/data/.env

else
  echo "[$(date -u)] .env file already exists, you may need to adjust its contents manually." >> ${CODE_SERVER_LOGS}/setup.log
fi
