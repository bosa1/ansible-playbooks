#!/bin/bash
export PATH=/usr/bin:/bin:/usr/sbin:/sbin

case "$1" in
  RedHat)
    yum -q check-update | grep -v '^$' | wc -l
    yum -q --security check-update | grep -v '^$' | wc -l ;;
  Suse)
    zypper -q list-patches | wc -l
    zypper -q list-patches -g security | wc -l ;;
  Debian)
    apt-get upgrade -s | grep -i "^inst " | wc -l
    apt-get upgrade -s | grep -i "^inst .*/.*-security " | wc -l ;;
  *)
    # Unknown OS family
    echo "0000"
    echo "0000" ;;
esac
