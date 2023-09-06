#!/bin/bash

echo -e "\033[0;31m\t\t CRI Config Start"
cat << EOF |tee /etc/crictl.yaml
runtime-endpoint: unix:///run/containerd/containerd.sock
image-endpoint: unix:///run/containerd/containerd.sock
timeout: 2
debug: false
pull-image-on-create: false

EOF
echo -e "\033[0;31m\t\t CRI Config Done"
