#!/bin/bash
mkdir etc
cd etc
git clone git@github.com:jq/server.git

cd server

DEVHOME=~/etc/server

# if you use default settings, do following, otherwise, use your own local settings
#ln -s $DEVHOME/local.template.sh $DEVHOME/local.sh 

ln -s $DEVHOME/.zshrc ~/.zshrc
ln -s $DEVHOME/.bash_profile .bash_profile
ln -s $DEVHOME/tmux.conf .tmux.conf