#!/bin/bash
#Variables
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

clear
#show versions
printf "%b-------------------------------------------------%b\n" "${BLUE}" "${NC}"
printf "%bBastionBot Installation%b\n" "${YELLOW}" "${NC}"
printf "%b-------------------------------------------------%b\n" "${BLUE}" "${NC}"
printf "%bMongoDB Version:%b " "${YELLOW}" "${NC}" && mongod --version
printf "%bNodeJS Version:%b " "${YELLOW}" "${NC}" && node -v
printf "%bPython Version:%b " "${YELLOW}" "${NC}" && python3 --version
printf "%b-------------------------------------------------%b\n" "${BLUE}" "${NC}"

cd /home/container || exit 1

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Replace Startup Variables
MODIFIED_STARTUP=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')
printf "%b:/home/container%b %s\n" "${YELLOW}" "${NC}" "${MODIFIED_STARTUP}"

# start mongo
printf "%b-------------------------------------------------%b\n" "${BLUE}" "${NC}"
printf "%bstarting MongoDB...%b\n" "${YELLOW}" "${NC}"
printf "%b-------------------------------------------------%b\n" "${BLUE}" "${NC}"
mongod --fork --dbpath /home/container/mongodb/ --port 27017 --logpath /home/container/mongod.log --logRotate reopen --logappend && until nc -z -v -w5 127.0.0.1 27017; do echo 'Waiting for mongodb connection...'; sleep 5; done

# Run the Server
printf "%b-------------------------------------------------%b\n" "${BLUE}" "${NC}"
printf "%bBastionBot starting...%b\n" "${YELLOW}" "${NC}"
printf "%b-------------------------------------------------%b\n" "${BLUE}" "${NC}"
# shellcheck disable=SC2086
eval "${MODIFIED_STARTUP}"

# stop mongo
mongod --eval 'db.adminCommand({ "shutdown" : 1 })'
