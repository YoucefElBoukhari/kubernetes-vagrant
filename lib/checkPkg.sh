#!/bin/bash

DIR=/vagrant/lib
if [ -d "$DIR" ];
then
    	echo "$DIR directory exists."
else
	echo "$DIR directory does not exist."
 	mkdir $DIR
  	echo "$DIR directory Created."
fi

FILE1=/vagrant/lib/cni-plugins-linux-amd64-v1.1.1.tgz
FILE2=/vagrant/lib/containerd-1.6.8-linux-amd64.tar.gz
FILE3=/vagrant/lib/runc.amd64

urls=('https://github.com/containernetworking/plugins/releases/download/v1.1.1/cni-plugins-linux-amd64-v1.1.1.tgz' 'https://github.com/containerd/containerd/releases/download/v1.6.8/containerd-1.6.8-linux-amd64.tar.gz' 'https://github.com/opencontainers/runc/releases/download/v1.1.3/runc.amd64')  ## input data
file=('/vagrant/lib/cni-plugins-linux-amd64-v1.1.1.tgz' '/vagrant/lib/containerd-1.6.8-linux-amd64.tar.gz' '/vagrant/lib/runc.amd64')
for ((i=-1;++i<${#urls[@]};)); do
	if test -f "${file[$i]}"; then
		echo "${file[$i]} exists."
	else
		  curl -L -s ${urls[$i]} >${file[$i]} &

	fi
done

until [[ -z `jobs|grep -E -v 'Done|Terminated'` ]]; do
  sleep 0.05; echo -n '.'                 ## do something while waiting
done

echo; ls -l /vagrant/lib/*.{t*,a*}                  ## list downloaded files
