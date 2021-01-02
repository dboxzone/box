#!/bin/bash

# Calculate the CWD
CWD="`dirname \"$0\"`"
CWD="`( cd \"$CWD\" && cd .. && pwd )`"

# Load the environment variables
set -o allexport
source "${CWD}/data/.env"
set +o allexport

echo "[$(date -u)] Booting up..." >> ${CODE_SERVER_LOGS}/setup.log

# Generate default auth/passwd in case of missing file
if [ ! -f "${CODE_SERVER_CWD}/data/passwd" ]; then
  echo "[$(date -u)] Writing Auth/passwd default password..." >> ${CODE_SERVER_LOGS}/setup.log
  echo "admin" > "${CODE_SERVER_CWD}/data/passwd"
fi

# Start CodeServer:
# If this is first run, it will generate the default password
sudo systemctl start code-server-ide

# Start the Docker project:
# This phase needs the DNS in place for Letsencrypt to work properly
if [ "no" != "${CODE_SERVER_AUTO_START}" ];
then
  docker-compose -f ${CWD}/docker-compose.yml up -d auth-passwd traefik code-server
fi

