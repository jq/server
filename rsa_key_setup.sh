#!/bin/bash

ssh-keygen -t rsa -b 4096 -C $1
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub

echo "https://github.com/settings/ssh to add git hub key"