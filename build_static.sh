#!/bin/sh
# Script to build the website as a static set of pages.
clean="$1"
BUILD_DIR="$2"
FINAL_SITE="localhost" #"project-trident.org"

if [ -z "${BUILD_DIR}" ] ; then
  BUILD_DIR="static_build"
fi

if [ 0 -ne `id -u` ] ; then
  CMD_PREFIX="sudo"
fi
echo "Deploying live site with nginx"
${CMD_PREFIX} ./deploy_nginx.sh

# Build the site
origdir="${PWD}"
cd grav-site
bin/plugin blackhole generate --force "http://localhost" --output-path "../${BUILD_DIR}" --output-url "http://${FINAL_SITE}" 

if [ "clean" = "${clean}" ] ; then
  echo "Stopping the live site on the local system..."
  ${CMD_PREFIX} service nginx stop
  ${CMD_PREFIX} service php-fpm stop
  ${CMD_PREFIX} sysrc -x rc_nginx_need
fi
