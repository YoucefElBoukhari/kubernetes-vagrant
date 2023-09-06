#!/bin/bash

echo -e "\033[0;31m\t\t FW Mod Start"
ufw allow 6443 > /dev/null 2>&1
ufw allow 6443/tcp > /dev/null 2>&1
ufw allow 6783/tcp > /dev/null 2>&1
ufw allow 6783/udp > /dev/null 2>&1
ufw allow 6784/udp > /dev/null 2>&1
echo -e "\033[0;31m\t\t FW Mod Done"
