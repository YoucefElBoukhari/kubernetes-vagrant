#!/bin/bash

echo -e "\033[0;31m\t\t Package Installion Start"
chmod 777 /vagrant/lib/checkPkg.sh > /dev/null 2>&1
bash /vagrant/lib/checkPkg.sh > /dev/null 2>&1
cd /vagrant/lib
sudo tar Cxzvf /usr/local containerd-1.6.8-linux-amd64.tar.gz  > /dev/null 2>&1
sudo install -m 755 runc.amd64 /usr/local/sbin/runc  > /dev/null 2>&1
sudo mkdir -p /opt/cni/bin   > /dev/null 2>&1
sudo tar Cxzvf /opt/cni/bin cni-plugins-linux-amd64-v1.1.1.tgz  > /dev/null 2>&1
sudo mkdir /etc/containerd  > /dev/null 2>&1
containerd config default | sudo tee /etc/containerd/config.toml  > /dev/null 2>&1
sudo sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml  > /dev/null 2>&1
sudo curl -L https://raw.githubusercontent.com/containerd/containerd/main/containerd.service -o /etc/systemd/system/containerd.service  > /dev/null 2>&1
sudo systemctl daemon-reload  > /dev/null 2>&1
sudo systemctl enable --now containerd  > /dev/null 2>&1
sudo systemctl status containerd 
echo -e "\033[0;31m\t\t Package Installion Done"
