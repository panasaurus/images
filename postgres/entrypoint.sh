#!/bin/bash
cd /home/container || exit 1

#output current postgres version
postgres --version

# Make internal Docker IP address available to processes.
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP


wait-port() {
	local port="${1:-$SERVER_PORT}"
	until nc -z 127.0.0.1 "$port" ; do
		sleep 1
	done
}
export -f wait-port 2>/dev/null || true

# Replace Startup Variables
MODIFIED_STARTUP=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
# shellcheck disable=SC2086
eval "${MODIFIED_STARTUP}"

# Ensure the server has a clean exit
pg_ctl -D /home/container/postgres_db/ stop
