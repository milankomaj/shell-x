#!/bin/bash
echo "Goodbye"
locale -a
sudo locale-gen sk_SK.utf8
sudo update-locale LANG=sk_SK.utf8
sudo timedatectl set-timezone Europe/Bratislava
exit