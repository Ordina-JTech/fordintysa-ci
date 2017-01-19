#!/bin/sh

# some literals with ANSI escape sequences for switching colours
red='\033[0;31m'
grn='\033[0;32m'
gry='\033[0;37m'
yel='\033[1;33m'
cya='\033[1;36m'
whi='\033[1;37m'

if [ `whoami` != 'root' ]
  then
    echo -e "${yel}Insufficient privileges."
    echo -e "${gry}Unable to cast the ${red}open${gry} spell. Maybe try this:"
    echo -e "   ${whi}sudo${gry} ./open.sh"
    exit
fi
if [ $# -lt 1 ]
  then
    echo -e "${yel}Required parameter missing.${gry}"
    echo "Open what, Ali Baba? The current directory contains:"
    ls -1
    exit
fi
if [ ! -r $1 ]
  then
    echo -e "${yel}$1: file or directory not found.${gry}"
    echo "Open what, Ali Baba? The current directory contains:"
    ls -1
    exit
fi
echo ""
echo -e "${whi}O===O ${cya} __  __  ___     ${yel}  __  ___ __  __      ___ ${cya} __  ${whi}O===O"
echo -e "${whi} [ ]  ${cya}/  \|  \|   |  | ${yel} /   |   /   /  \|  ||    ${cya}|  | ${whi} [ ]"
echo -e "${whi} [ ]  ${cya}|  ||__/|__ |\ | ${yel} \__ |__ \__ |__||\/||__  ${cya} \/  ${whi} [ ]"
echo -e "${whi} [ ]  ${cya}|  ||   |   | \| ${yel}    \|      \|  ||  ||    ${cya} __  ${whi} [ ]"
echo -e "${whi} [ ]  ${cya}\__/|   |___|  | ${yel}  __/|___ __/|  ||  ||___ ${cya} \/  ${whi} [ ]"
echo -e "${whi}O===O                                                 ${whi}O===O"
echo -e "${gry}"

## install docker-compose (if not done already)
docker-compose version
if [ $? -ne 0 ]
  then
    echo "installing docker-compose ..."
    curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
fi

# prepare files for docker-compose
cp $1 docker-compose.yml
ip=`ip route | awk '/eth1/ { print $9 }'`

# build the composition
docker-compose build

echo "Your build server will be up & running at ${grn}http://${ip}/${gry} after you enter the following command:"
echo -e "${whi}   docker-compose up${gry}"
