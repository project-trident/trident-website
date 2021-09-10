#!/bin/sh
#Script to take the statically-generated pages and deploy them with nginx
DIST_DIR="$1"
PROFILE_NAME="trident"
FINAL_SITE="project-trident.org"

if [ -z "${DIST_DIR}" ] ; then
  DIST_DIR="/usr/local/www/${PROFILE_NAME}"
fi

if [ 0 -ne `id -u` ] ; then
  CMD_PREFIX="sudo"
fi

# Build the static site with Hugo and deploy it in the dist dir
basedir=`dirname $0`
cd "${basedir}/hugo-site"
/usr/local/bin/hugo --ignoreCache -b "http://${FINAL_SITE}" -d "${basedir}/dist"
cd ..
chown -R www:www "${basedir}/dist"

if [ -d "${DIST_DIR}" ] ; then
  ${CMD_PREFIX} rm -rf "${DIST_DIR}"
fi
${CMD_PREFIX} mv "${basedir}/dist" "${DIST_DIR}"
# Now copy over the nginx config file and enable it
#nginx_config="/usr/local/etc/nginx-${PROFILE_NAME}.conf"
#${CMD_PREFIX} cp nginx-hugo.conf "${nginx_config}"
#${CMD_PREFIX} sed -i '' "s|%%ROOT_DIR%%|${DIST_DIR}|g" "${nginx_config}"
#${CMD_PREFIX} sed -i '' "s|%%SITE_URL%%|${FINAL_SITE}|g" "${nginx_config}"

#${CMD_PREFIX} sysrc nginx_enable=YES
#${CMD_PREFIX} sysrc nginx_config="${nginx_config}"
#${CMD_PREFIX} sysrc nginx_profiles+=" ${PROFILE_NAME}"
#${CMD_PREFIX} sysrc nginx_${PROFILE_NAME}_configfile="${nginx_config}"
#${CMD_PREFIX} sysrc -x rc_nginx_need

#Now start the webserver
#${CMD_PREFIX} service nginx restart
exit $?
