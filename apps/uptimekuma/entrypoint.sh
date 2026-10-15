#!/bin/ash
# shellcheck shell=dash

# System variables
clear
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Switch to the container's working directory
cd /home/container || exit 1

# Wait for the container to fully initialize
sleep 1

# Default the TZ environment variable to UTC.
TZ=${TZ:-UTC}
export TZ

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# system informations
printf "%b-------------------------------------------------%b\n" "${BLUE}" "${NC}"
printf "%bUptime Kuma Image%b\n" "${RED}" "${NC}"
printf "%b-------------------------------------------------%b\n" "${BLUE}" "${NC}"
printf "%bRunning on Alpine: %b %s%b\n" "${YELLOW}" "${RED}" "$(cat /etc/alpine-release)" "${NC}"
printf "%bCurrent timezone: %b %s %b\n" "${YELLOW}" "${RED}" "${TZ}" "${NC}"
printf "%bNodeJS Version: %b %s %b\n" "${YELLOW}" "${RED}" "$(node -v)" "${NC}"
printf "%bCloudflared Version: %b %s %b\n" "${YELLOW}" "${RED}" "$(/usr/bin/cloudflared --version)" "${NC}"
printf "%b-------------------------------------------------%b\n" "${BLUE}" "${NC}"

export PATH=$PATH:/root/.local/bin

# Replace Startup Variables
MODIFIED_STARTUP=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
# shellcheck disable=SC2086
eval "${MODIFIED_STARTUP}"
