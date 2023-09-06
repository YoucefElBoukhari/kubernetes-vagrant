#!/bin/bash
echo -e "\033[0;31m\t\t sysctl params Start"
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF
sudo sysctl --system
modprobe br_netfilter
sysctl net.bridge.bridge-nf-call-iptables=1
modprobe br_netfilter
echo 1 > /proc/sys/net/ipv4/ip_forward
echo -e "\033[0;31m\t\t sysctl params Done"
