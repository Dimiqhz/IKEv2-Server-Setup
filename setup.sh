#!/bin/sh
# Update packages on server
apt update

if [ ! -f /etc/os-release ]; then
    echo "Unable to determine operating system. File /etc/os-release is missing."
    exit 1
fi

. /etc/os-release

SUPPORTED=("debian:12" "ubuntu:22.04" "ubuntu:24.04")
CURRENT_OS="$ID:$VERSION_ID"

if [[ " ${SUPPORTED[@]} " =~ " $CURRENT_OS " ]]; then
    echo "You are using a supported OS: $PRETTY_NAME"
else
    echo "Unsupported operating system: $PRETTY_NAME"
    echo "The script only works on Debian 12, Ubuntu 22.04 or Ubuntu 24.04."
    exit 1
fi