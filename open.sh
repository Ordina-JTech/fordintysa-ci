#!/bin/sh

# some literals with ANSI escape sequences for switching colours
red='\033[0;31m'
grn='\033[0;32m'
gry='\033[0;37m'
yel='\033[1;33m'
cya='\033[1;36m'
whi='\033[1;37m'

echo ""
echo -e "${whi}O===O ${cya} __  __  ___     ${yel}  __  ___ __  __      ___ ${cya} __  ${whi}O===O"
if [ `whoami` != 'root' ]
  then
    echo -e "${yel}Insufficient privileges."
    echo -e "${gry}Unable to cast the ${red}open${gry} spell. Maybe try this:"
    echo -e "   ${whi}sudo${gry} ./open.sh"
    exit
fi
echo -e "${whi} [ ]  ${cya}/  \|  \|   |  | ${yel} /   |   /   /  \|  ||    ${cya}|  | ${whi} [ ]"
if [ $# -lt 1 ]
  then
    echo -e "${yel}Required parameter missing.${gry}"
    echo "Open what, Ali Baba? The current directory contains:"
    ls -1
    exit
fi
echo -e "${whi} [ ]  ${cya}|  ||__/|__ |\ | ${yel} \__ |__ \__ |__||\/||__  ${cya} \/  ${whi} [ ]"
if [ ! -r $1 ]
  then
    echo -e "${yel}$1: file or directory not found.${gry}"
    echo "Open what, Ali Baba? The current directory contains:"
    ls -1
    exit
fi
echo -e "${whi} [ ]  ${cya}|  ||   |   | \| ${yel}    \|      \|  ||  ||    ${cya} __  ${whi} [ ]"
echo -e "${whi} [ ]  ${cya}\__/|   |___|  | ${yel}  __/|___ __/|  ||  ||___ ${cya} \/  ${whi} [ ]"
echo -e "${whi}O===O                                                 ${whi}O===O"
echo -e "${gry}"

## is docker-compose installed?
docker-compose version 2> /dev/null
if [ $? -ne 0 ]
  then
    echo -e "${whi}Installing docker-compose${gry}"
    curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
fi

# prepare files for docker-compose
ip=`ip route | awk '/eth1/ { print $9 }'`
cat $1 | sed s/$\{ip\}/$ip/ > docker-compose.yml
mkdir ./homepage/tmp
cat ./homepage/default.conf | sed s/$\{ip\}/$ip/ > ./homepage/tmp/default.conf
 
# build the composition
docker-compose build
if [ $? -ne 0 ]
  then
    echo "Sorry, something went wrong..."
    exit
fi

echo -e "Your build server will be up & running at ${grn}http://${ip}/${gry} after you enter the following command, until you type ${whi}Ctrl-C${gry}:"
echo -e "${whi}   docker-compose up${gry}"
