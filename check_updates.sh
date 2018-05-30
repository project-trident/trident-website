#!/bin/sh
#=================
# Quick script to see if there are changes available on the repo and to run a command if so
# This is designed for being put into a cron job or for running on a schedule
#  WARNING: Make sure that the repo is not private or using a password-protected SSH key
#     since this script expects to be able to pull with git non-interactively.
#=================

script_run="deploy_nginx.sh"

current_dir=`dirname "$0"`
if [ ! "." = "${current_dir}" ] ; then
  cd "${current_dir}"
fi

#See if the current repo has any updates available
result=`git pull | grep "Already up to date"`
if [ -z "${result}" ] ; then
  echo "Repo updated: Running Script ${script_run}"
  ./${script_run}
fi
