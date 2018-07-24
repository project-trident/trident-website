#!/bin/sh
#Script to take the statically-generated pages and deploy them with nginx
STATIC_DIR="$1"
DIST_DIR="$2"
PROFILE_NAME="trident"
FINAL_SITE="localhost" #project-trident.org"

if [ -z "${STATIC_DIR}" ] ; then
  STATIC_DIR="static_build"
fi
if [ -z "${DIST_DIR}" ] ; then
  DIST_DIR="/usr/local/www/${PROFILE_NAME}"
fi

if [ 0 -ne `id -u` ] ; then
  CMD_PREFIX="sudo"
fi

# Build the static site with Hugo and deploy it in the dist dir
if [ -d "${DIST_DIR}" ] ; then
  ${CMD_PREFIX} rm -rf "${DIST_DIR}"
fi
cd hugo-site
${CMD_PREFIX} hugo -b "http://${FINAL_SITE}" -d "${DIST_DIR}"
cd ..
${CMD_PREFIX} chown -R www:www "${DIST_DIR}"

# Now copy over the nginx config file and enable it
nginx_config="/usr/local/etc/nginx-${PROFILE_NAME}.conf"
${CMD_PREFIX} cp nginx-hugo.conf "${nginx_config}"
${CMD_PREFIX} sed -i '' "s|%%ROOT_DIR%%|${DIST_DIR}|g" "${nginx_config}"
${CMD_PREFIX} sed -i '' "s|%%SITE_URL%%|${FINAL_SITE}|g" "${nginx_config}"

${CMD_PREFIX} sysrc nginx_enable=YES
${CMD_PREFIX} sysrc nginx_config="${nginx_config}"
${CMD_PREFIX} sysrc nginx_profiles+=" ${PROFILE_NAME}"
${CMD_PREFIX} sysrc nginx_${PROFILE_NAME}_configfile="${nginx_config}"
${CMD_PREFIX} sysrc -x rc_nginx_need

#Now start the webserver
${CMD_PREFIX} service nginx restart
exit $?
