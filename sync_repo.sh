#!/bin/bash
# -*- coding: utf-8 -*-
#
# Date: 2009/2/17
# Author: billy3321
# A simple script use to sync your repo with others.
#

function push_repo (){
while true
do
read -p "Pull success. Continue push to your repo?(Y/n)" PUSH_REPO
  case $PUSH_REPO in
   "Y"|"y"|"")
   git push && echo "Push success."
   break
   ;;
   "N"|"n")
   echo "Stop push."
   break
   ;;
   *)
   echo "Please enter a choice."
   ;;
   esac
done
}


function choice_branch(){
read -p "Enter the branch you want to merge or push enter to merge to master:" BRANCH
if [ -z $BRANCH ];then
  BRANCH="master"
fi
}

echo "Whos repo you want to sync?"
echo "1. mrmoneyc"
echo "2. billy3321"
echo "Please enter your choice:"
read -p "What do you want to do now? Please enter the number:" ACT
  case $ACT in
   "1")
   choice_branch
   git pull git://github.com/mrmoneyc/lazyscripts_pool_fedora.git $BRANCH && push_repo
   ;;
   "2")
   choice_branch
   git pull git://github.com/billy3321/lazyscripts_pool_fedora.git $BRANCH && push_repo
   ;;
   *)
   echo "Please enter a number."
   ;;
   esac


#END
