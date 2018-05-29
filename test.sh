#!/bin/sh

#Make sure all the required packages are installed first
for _pkg in `cat pkg_list`
do
  echo "Checking for Package: ${_pkg}"
  pkg info -qe  "${_pkg}"
  if [ $? -eq 1 ] ; then
    _pkg_needed="${_pkg_needed} ${_pkg}"
  fi
done
if [ -n "${_pkg_needed}" ] ; then
echo "Installing Required Packages: ${_pkg_needed}"
    sudo pkg install "${_pkg_needed}"
    if [ $? -ne 0 ] ; then
      echo "[ERROR] Unable to install packages: ${_pkg_needed}"
      exit 1
    fi
fi
#Now start up the internal test server on port 8000
origdir=${PWD}
cd grav-site
/usr/local/bin/php -S localhost:8000 system/router.php
# test finished, go ahead and clear the cache files
bin/grav clear
cd "${origdir}"
