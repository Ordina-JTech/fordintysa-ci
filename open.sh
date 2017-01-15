#!/bin/sh
if [ `whoami` != 'root' ]
  then
    echo "Insufficient privileges to cast the 'open' spell!"
    echo "try 'sudo ./open.sh' instead."
    exit
fi
if [ $# -lt 1 ]
  then
    echo "Mandatory argument missing."
    echo "Open what, Ali Baba? This is what we have:"
    ls 
    exit
fi
if [ ! -r $1 ]
  then
    echo "$1 not found!"
    echo "Open what, Ali Baba? This is what we have:"
    ls 
    exit
fi
echo ""
echo "O===O  __  __  ___       __  ___ __  __      ___  __  O===O"
echo " | |  /  \|  \|   |  |  /   |   /   /  \|  ||    |  |  | |"
echo " | |  |  ||__/|__ |\ |  \__ |__ \__ |__||\/||__   \/   | |"
echo " | |  |  ||   |   | \|     \|      \|  ||  ||     __   | |"
echo " | |  \__/|   |___|  |   __/|___ __/|  ||  ||___  \/   | |"
echo "O===O                                                 O===O"
echo ""
