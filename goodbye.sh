#!/bin/bash
echo "Goodbye"
sudo locale-gen sk_SK.utf8
sudo update-locale LANG=sk_SK.utf8
sudo timedatectl set-timezone Europe/Bratislava
date