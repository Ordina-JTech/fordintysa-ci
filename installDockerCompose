#!/bin/sh

## This script installs docker-compose.
#  It is meant for users of the Docker Toolbox, which does not include
#  docker-compose by default, and doesn't store it permanently.
#  So after a restart of docker-machine, a reinstall is required.

docker-compose version > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "docker-compose already installed"
    exit
fi

if [ `whoami` != 'root' ]; then
    echo "Insufficient privileges."
    echo "Maybe try this:"
    echo "   sudo ./installDockerCompose.sh"
    exit
fi

echo "Installing docker-compose"
curl -L https://github.com/docker/compose/releases/download/1.10.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
if [ $? -ne 0 ]; then
    echo "Sorry, something went wrong..."
    exit
fi
chmod +x /usr/local/bin/docker-compose
