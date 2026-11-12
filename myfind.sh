#!/bin/bash

if [ "$#" != 3 ]; then
  echo "nu sunt suficiente argumente"
  exit 1
fi

if [ ! -e "$1" ]; then
  echo "$1 nu exista"
  exit 1
elif [ ! -d "$1" ]; then
  echo "$1 trebuie sa fie un director"
  exit 1
fi

case "$2" in 
  -name)
    echo "ramura -name"
    for x in "$1"/*;do
      if [[ $(basename "$x") == $3 ]]; then
	echo "$x"
      fi
    done;;
  -type)
    echo "ramura -type"
    for x in "$1"/*;do
      if [ -"$3" "$x" ];then
	echo "$x"
      fi
    done;;
  -exec)
    echo "ramura -exec"
    for x in "$1"/*"$3";do
       echo "$x"
    done;;
  *) 
    echo "argument necunoscut: $2"; exit 1 ;;
esac

exit 0
