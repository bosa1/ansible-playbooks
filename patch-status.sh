#!/bin/bash
export PATH=/usr/bin:/bin:/usr/sbin:/sbin

case "$1" in
  RedHat)
    yum -q ${2:+--security} check-update | grep -v '^$' | wc -l ;;
  Suse)
    zypper -q list-patches ${2:+-g security}| wc -l ;;
  Debian)
    apt-get upgrade -s | grep -i "^inst .*/.*${2:+-security} " | wc -l ;;
  *)
    echo "OS family $1 not supported" ;;
esac
