#!/bin/sh
#=================================
# Setup script for provisioning a VM to serve a website
# WARNING: Make sure this is run with root permissions
#=================================

#define the script we need to run periodically (in current dir)
update_script="check_updates.sh"
update_minutes="30"

crontab_file="/usr/local/etc/cron.d/root"

#Permissions Check
if [ 0 -ne `id -u` ] ; then
  echo "This script must be run as root!!"
  exit 1
fi

#Now get the location of the current directory
current_dir=`dirname "$0"`
if [ "." = "${current_dir}" ] ; then
  current_dir="${PWD}"
fi

#Put the entry into crontab for running this on the designated schedule
echo "*/${update_minutes}	*	*	*	*	root ${current_dir}/${update_script}" >> /etc/crontab

#Now run the deploy script that the update script will also run
script=grep "script_run=" "${update_script}" | cut -d = -f 2
${script}
