#!/bin/bash

echo -e "\033[0;31m\t\t Cluster Init Start"
cd /vagrant/lib
bash /vagrant/lib/join
echo -e "\033[0;31m\t\t Cluster Init Done"
