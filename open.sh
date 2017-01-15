#!/bin/sh
red='\033[0;31m'
grn='\033[0;32m'
gry='\033[0;37m'
yel='\033[1;33m'
whi='\033[1;37m'
if [ `whoami` != 'root' ]
  then
    echo -e "${yel}Insufficient privileges to cast the ${red}open${yel} spell!"
    echo -e "${gry}try ${grn}sudo ./open.sh${gry} instead."
    exit
fi
if [ $# -lt 1 ]
  then
    echo -e "${yel}Mandatory argument missing.${gry}"
    echo "Open what, Ali Baba? Available files:"
    ls -1
    exit
fi
if [ ! -r $1 ]
  then
    echo -e "${yel}File '$1' not found!${gry}"
    echo "Open what, Ali Baba? Available files:"
    ls -1
    exit
fi
echo ""
echo "O===O  __  __  ___       __  ___ __  __      ___  __  O===O"
echo " [ ]  /  \|  \|   |  |  /   |   /   /  \|  ||    |  |  [ ]"
echo " [ ]  |  ||__/|__ |\ |  \__ |__ \__ |__||\/||__   \/   [ ]"
echo " [ ]  |  ||   |   | \|     \|      \|  ||  ||     __   [ ]"
echo " [ ]  \__/|   |___|  |   __/|___ __/|  ||  ||___  \/   [ ]"
echo "O===O                                                 O===O"
echo ""
