#!/bin/bash
cd /home/container || exit 1

# Make internal Docker IP address available to processes.
INTERNAL_IP=$(ip route get 1.1.1.1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP


## if auto_update is not set or to 1 update
if [ -z "${AUTO_UPDATE}" ] || [ "${AUTO_UPDATE}" == "1" ]; then
	./steamcmd/steamcmd.sh +force_install_dir /home/container +login anonymous +app_update 258550 +quit
else
    echo -e "Not updating game server as auto update was set to 0. Starting Server"
fi

# Replace Startup Variables
# shellcheck disable=SC2046  # unquoted: the command must be word-split
MODIFIED_STARTUP=$(eval echo $(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g'))
echo ":/home/container$ ${MODIFIED_STARTUP}"

if [[ "${FRAMEWORK}" == "carbon" ]]; then
    # Carbon: https://github.com/CarbonCommunity/Carbon.Core
    echo "Updating Carbon..."
    curl -sSL "https://github.com/CarbonCommunity/Carbon.Core/releases/download/production_build/Carbon.Linux.Release.tar.gz" | tar zx
    echo "Done updating Carbon!"

    export DOORSTOP_ENABLED=1
    DOORSTOP_TARGET_ASSEMBLY="$(pwd)/carbon/managed/Carbon.Preloader.dll"
export DOORSTOP_TARGET_ASSEMBLY
    MODIFIED_STARTUP="LD_PRELOAD=$(pwd)/libdoorstop.so ${MODIFIED_STARTUP}"

elif [[ "$OXIDE" == "1" ]] || [[ "${FRAMEWORK}" == "oxide" ]]; then
    # Oxide: https://github.com/OxideMod/Oxide.Rust
    echo "Updating uMod..."
    curl -sSL "https://github.com/OxideMod/Oxide.Rust/releases/latest/download/Oxide.Rust-linux.zip" > umod.zip
    unzip -o -q umod.zip
    rm umod.zip
    echo "Done updating uMod!"
# else Vanilla, do nothing
fi

# Fix for Rust not starting
LD_LIBRARY_PATH=$(pwd)/RustDedicated_Data/Plugins/x86_64:$(pwd)
export LD_LIBRARY_PATH

# Run the Server
node /wrapper.js "${MODIFIED_STARTUP}"
