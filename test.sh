#!/bin/sh

#Make sure all the required packages are installed first
for _pkg in `cat pkg_list`
do
  echo "Checking for Package: ${_pkg}"
  pkg info -qe  "${_pkg}"
  if [ $? -eq 1 ] ; then
    echo "Installing Required Package: ${_pkg}"
    sudo pkg install "${_pkg}"
    if [ $? -ne 0 ] ; then
      echo "[ERROR] Unable to install package: ${_pkg}"
      exit 1
    fi
  fi
done

#Now start up the internal test server on port 8000
origdir=${PWD}
cd grav-site
/usr/local/bin/php -S localhost:8000 system/router.php
cd "${origdir}"

