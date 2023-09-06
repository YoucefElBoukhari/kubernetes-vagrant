#!/bin/bash

echo -e "\033[0;31m\t\t Repo conf Start"
apt-get update > /dev/null 2>&1 && apt-get install -y apt-transport-https ca-certificates curl > /dev/null 2>&1
sudo apt-get install -y vim > /dev/null 2>&1
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg > /dev/null 2>&1
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
echo -e "\033[0;31m\t\t Repo conf Done"
