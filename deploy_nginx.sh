#!/bin/sh

PROFILE_NAME="trident"
DIST_DIR=$1
if [ -z "${DIST_DIR}" ] ; then
  DIST_DIR="/usr/local/www/${PROFILE_NAME}"
fi

if [ 0 -ne `id -u` ] ; then
  echo "This script need to run with root permissions!"
  exit 1
fi

cdir=`dirname $0`
cd "${cdir}"
echo "Copying website over to distribution dir: ${DIST_DIR}"

#Make sure all the required packages are installed first
#Make sure all the required packages are installed first
for _pkg in nginx `cat pkg_list`
do
  echo "Checking for Package: ${_pkg}"
  pkg info -qe  "${_pkg}"
  if [ $? -eq 1 ] ; then
    _pkg_needed="${_pkg_needed} ${_pkg}"
  fi
done
if [ -n "${_pkg_needed}" ] ; then
echo "Installing Required Packages: ${_pkg_needed}"
    sudo pkg install -y ${_pkg_needed}
    if [ $? -ne 0 ] ; then
      echo "[ERROR] Unable to install packages: ${_pkg_needed}"
      exit 1
    fi
fi

#Move the site files over to the publication directory
sh deploy_hugo.sh

exit $?

# Old Grav install routine
# ===============
#cp -R grav-site "${DIST_DIR}"
#chown -R www:www "${DIST_DIR}"
#Setup the nginx profile settings
#nginx_config="/usr/local/etc/nginx-${PROFILE_NAME}.conf"
#cp "nginx-live.conf" "${nginx_config}"
#sed -i conf "s|%%ROOT_DIR%%|${DIST_DIR}|g" "${nginx_config}"

#sysrc nginx_config="${nginx_config}"
#sysrc nginx_profiles+=" ${PROFILE_NAME}"
#sysrc nginx_${PROFILE_NAME}_configfile="${nginx_config}"

#sysrc rc_nginx_need="php-fpm"

#Now start the webserver
#service nginx restart
