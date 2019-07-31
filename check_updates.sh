#!/bin/sh
#=================
# Quick script to see if there are changes available on the repo and to run a command if so
# This is designed for being put into a cron job or for running on a schedule
#  WARNING: Make sure that the repo is not private or using a password-protected SSH key
#     since this script expects to be able to pull with git non-interactively.
#=================

script_run="deploy_nginx.sh"
always=${1}

current_dir=`dirname "$0"`
cd "${current_dir}"
#See if the current repo has any updates available
result=`git pull | grep "Already up to date"`
if [ -z "${result}" ] || [ -n "${always}" ] ; then
  cd "${current_dir}"
  echo "Repo updated: Running Script ${script_run}"
  #Do not use the "." shortcut - git pull can destroy/recreate that dir link
  ${current_dir}/${script_run}
else
  #Verify that the nginx service is still running, and restart as needed
  service nginx status
  if [ $? -ne 0 ] ; then
    service nginx restart
  fi
fi
