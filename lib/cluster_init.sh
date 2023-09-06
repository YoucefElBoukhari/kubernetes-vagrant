#!/bin/bash


echo -e "\033[0;31m\t\t Cluster Init Start"
MASTER_IP="`ip --br a|grep enp|awk  '{print $3}'|grep "^10.*"|sed 's|/24||g'|tail -1`"
kubeadm init --apiserver-cert-extra-sans=controlplane --apiserver-advertise-address=$MASTER_IP --pod-network-cidr=192.168.0.0/16
export KUBECONFIG=/etc/kubernetes/admin.conf
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml
TOKEN=`kubeadm token generate`
kubeadm token create $TOKEN --print-join-command > /vagrant/lib/join
unset MASTER_IP
unset TOKEN
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
echo -e "\033[0;31m\t\t Cluster Init Done"
