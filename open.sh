#!/bin/sh

## is docker installed?
docker --version 1> /dev/null
if [ $? -ne 0 ]; then
    echo "Error: docker not installed."
    exit
fi

# some literals with ANSI escape sequences for switching colours
red='\033[0;31m'
grn='\033[0;32m'
gry='\033[0;37m'
yel='\033[1;33m'
cya='\033[1;36m'
whi='\033[1;37m'

echo ""
echo -e "${whi}O===O ${cya} __  __  ___     ${yel}  __  ___ __  __      ___ ${cya} __  ${whi}O===O"

# root access required?
docker-compose version > /dev/null 2>&1
composeretc=$?
needroot=$composeretc
if [ $needroot -gt 0 ] && [ `whoami` != 'root' ]; then
    echo -e "${yel}Insufficient privileges."
    echo -e "${gry}Unable to cast the ${red}open${gry} spell. Maybe try this:"
    echo -e "   ${whi}sudo${gry} ./open.sh"
    exit
fi
echo -e "${whi} [ ]  ${cya}/  \|  \|   |  | ${yel} /   |   /   /  \|  ||    ${cya}|  | ${whi} [ ]"
if [ $# -lt 1 ]; then
    echo -e "${yel}Required parameter missing.${gry}"
    echo "Open what, Ali Baba? The current directory contains:"
    ls -1 *.*
    exit
fi
echo -e "${whi} [ ]  ${cya}|  ||__/|__ |\ | ${yel} \__ |__ \__ |__||\/||__  ${cya} \/  ${whi} [ ]"
if [ ! -r $1 ]; then
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
# empty result?
if [ ${ip}"x" = "x" ]; then
    # not VirtualBox, try Mac approach
	ip=`ifconfig | grep "inet ." | awk '/broadcast/ { print $2 }'`
fi
echo -e "Detected ip address: ${whi}${ip}${gry}"
case "$ip" in
  192.168.99.*)
    # looks alright
    ;;
  *)
    echo -n "Is this correct? (y/n) : "
    read -n 1 answer
    echo ""
    if [ $answer != "y" ] && [ $answer != "Y" ]; then
        echo -n "Enter your ip address : "
    	read ip
    fi
esac

docker-compose version 2> /dev/null
if [ $composeretc -ne 0 ]; then
    echo -e "${whi}Installing docker-compose${gry}"
    curl -L https://github.com/docker/compose/releases/download/1.10.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
	if [ $? -ne 0 ]; then
	    echo "Sorry, something went wrong..."
		exit
	fi
    chmod +x /usr/local/bin/docker-compose
fi

# prepare files for docker-compose
if [ ! -f docker-compose.yml ]; then
    ln -s sesame.yml docker-compose.yml
fi
mkdir ./homepage/tmp 2> /dev/null
cat ./homepage/default.conf | sed s/$\{ip\}/$ip/ > ./homepage/tmp/default.conf

clone=y
if [ -d ./gitblit/tmp/OrdinaJTech ]; then
    echo -n "Remove and re-clone repositories from GitHub? (y/n) : "
    read -n 1 clone
    if [ $clone = "y" ] || [ $clone = "Y" ]; then
        rm -rf ./gitblit/tmp
    fi
fi
echo ""
if [ $clone = "y" ] || [ $clone = "Y" ]; then
    echo -e "${whi}Clone some GitHub repositories...${gry}"
    git clone https://github.com/ordina-jtech/fordintysa-ci.git ./gitblit/tmp/OrdinaJTech/fordintysa-ci.git --bare
    if [ $? -ne 0 ]; then
        echo "Sorry, something went wrong..."
        exit
    fi
    cat ./gitblit/fordintysa.config >> ./gitblit/tmp/OrdinaJTech/fordintysa-ci.git/config
    
    ## clone some extra repos:
    git clone https://github.com/jqno/equalsverifier.git ./gitblit/tmp/jqno/equalsverifier.git --bare
    cat ./gitblit/equalsverifier.config >> ./gitblit/tmp/jqno/equalsverifier.git/config
    
    git clone https://github.com/jqno/mutable-java.git ./gitblit/tmp/jqno/mutable-java.git --bare
    cat ./gitblit/mutable-java.config >> ./gitblit/tmp/jqno/mutable-java.git/config
    
    git clone https://github.com/IvoNet/ApacheCommonsEqualsHashcode.git ./gitblit/tmp/IvoNet/ApacheCommonsEqualsHashcode.git --bare
    cat ./gitblit/equalshashcode.config >> ./gitblit/tmp/IvoNet/ApacheCommonsEqualsHashcode.git/config
fi

# build the composition
echo -e "${whi}Start docker-compose build...${gry}"
docker-compose build
if [ $? -ne 0 ]; then
    echo "Sorry, something went wrong..."
    exit
fi

echo
echo -e "Your build server will be up & running at ${grn}http://${ip}/${gry}"
echo -e "if you enter the following command:"
echo -e "${grn}docker-compose up -d${gry}"
echo
echo -e "If you want to stop it later on, type:"
echo -e "${grn}docker-compose stop${gry}"
echo
