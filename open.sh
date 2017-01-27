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
    ls -1 *.*
    exit
fi
echo -e "${whi} [ ]  ${cya}|  ||__/|__ |\ | ${yel} \__ |__ \__ |__||\/||__  ${cya} \/  ${whi} [ ]"
if [ ! -r $1 ]
  then
    echo -e "${yel}$1: file or directory not found.${gry}"
    echo "Open what, Ali Baba? The current directory contains:"
    ls -1 *.*
    exit
fi
echo -e "${whi} [ ]  ${cya}|  ||   |   | \| ${yel}    \|      \|  ||  ||    ${cya} __  ${whi} [ ]"
echo -e "${whi} [ ]  ${cya}\__/|   |___|  | ${yel}  __/|___ __/|  ||  ||___ ${cya} \/  ${whi} [ ]"
echo -e "${whi}O===O                                                 ${whi}O===O"
echo -e "${gry}"

## check the ip address
ip=`ip route | awk '/eth1/ { print $9 }'`
echo -e "Detected ip address: ${whi}${ip}${gry}"
echo -n "Is this correct? (y/n) : "
read -n 1 answer
echo ""
if [ $answer != "y" ] && [ $answer != "Y" ]
  then
    echo -n "Enter your ip address : "
	read ip
fi

## is docker-compose installed?
docker-compose version 2> /dev/null
if [ $? -ne 0 ]
  then
    echo -e "${whi}Installing docker-compose${gry}"
    curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
	if [ $? -ne 0 ]
	  then
	    echo "Sorry, something went wrong..."
		exit
	fi
    chmod +x /usr/local/bin/docker-compose
fi

# prepare files for docker-compose
cat $1 | sed s/$\{ip\}/$ip/ > docker-compose.yml
if [ -d ./gitblit/tmp ]
  then
    rm -rf ./gitblit/tmp
fi
git clone https://github.com/ordina-jtech/fordintysa-ci.git ./gitblit/tmp/fordintysa-ci.git --bare
if [ $? -ne 0 ]
  then
    echo "Sorry, something went wrong..."
    exit
fi

 
# build the composition
docker-compose build
if [ $? -ne 0 ]
  then
    echo "Sorry, something went wrong..."
    exit
fi

echo -e "Your build server will be up & running at ${grn}http://${ip}/${gry}"
echo -e "if you enter the following command:"
echo -e "${whi}   docker-compose up${gry}"
echo -e "Press ${whi}Ctrl-C${gry} to stop it."
