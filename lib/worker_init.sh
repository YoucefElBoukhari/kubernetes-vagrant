#!/bin/bash

echo -e "\033[0;31m\t\t Worker Init Start"
sudo apt-get update > /dev/null 2>&1 && sudo apt-get install -y kubelet=1.25.0-00 kubeadm=1.25.0-00 > /dev/null 2>&1
sudo apt-mark hold kubelet kubeadm > /dev/null 2>&1
#sed -i 's/127.0.2.1 '"`hostname`"' '"`hostname`"'/127.0.2.1 '"`hostname`"' '"`hostname`"' '"`hostname| tr '[:upper:]' '[:lower:]'`"'/g' /etc/hosts
PRIVATE_IP="`ip --br a|grep enp|awk  '{print $3}'|grep "^10.*"|sed 's|/24||g'|tail -1`"
echo "$PRIVATE_IP "`hostname| tr '[:upper:]' '[:lower:]'`"" >> /etc/hosts
echo -e "\033[0;31m\t\t Worker Init Done"
