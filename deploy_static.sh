#!/bin/sh
#Script to take the statically-generated pages and deploy them with nginx
STATIC_DIR="$1"
DIST_DIR="$2"
PROFILE_NAME="trident"
FINAL_SITE="localhost" #"project-trident.org"

if [ -z "${STATIC_DIR}" ] ; then
  STATIC_DIR="static_build"
fi
if [ -z "${DIST_DIR}" ] ; then
  DIST_DIR="/usr/local/www/${PROFILE_NAME}"
fi

if [ 0 -ne `id -u` ] ; then
  CMD_PREFIX="sudo"
fi

if [ ! -d "${STATIC_DIR}" ] ; then
  echo "Building Static Site..."
  ./build_static.sh clean "${STATIC_DIR}"
fi

echo "Installing static site..."
if [ -d "${DIST_DIR}" ] ; then
  ${CMD_PREFIX} rm -r "${DIST_DIR}"
fi
${CMD_PREFIX} cp -r grav-site "${DIST_DIR}"
${CMD_PREFIX} cp -r ${STATIC_DIR}/* "${DIST_DIR}/"
${CMD_PREFIX} chown -R www:www "${DIST_DIR}"

#Setup the nginx profile settings
nginx_config="/usr/local/etc/nginx-${PROFILE_NAME}.conf"
${CMD_PREFIX} cp "nginx-static.conf" "${nginx_config}"
${CMD_PREFIX} sed -i conf "s|%%ROOT_DIR%%|${DIST_DIR}|g" "${nginx_config}"
${CMD_PREFIX} sed -i conf "s|%%SITE_URL%%|${FINAL_SITE}|g" "${nginx_config}"

${CMD_PREFIX} sysrc nginx_config="${nginx_config}"
${CMD_PREFIX} sysrc nginx_profiles+=" ${PROFILE_NAME}"
${CMD_PREFIX} sysrc nginx_${PROFILE_NAME}_configfile="${nginx_config}"

#Now start the webserver
${CMD_PREFIX} service nginx restart
