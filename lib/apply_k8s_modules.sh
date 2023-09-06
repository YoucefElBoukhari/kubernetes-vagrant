#!/bin/bash

echo -e "\033[0;31m\t\t K8S Mod Start"

cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF
sudo modprobe overlay
sudo modprobe br_netfilter

echo -e "\033[0;31m\t\t K8S Mod Done"
