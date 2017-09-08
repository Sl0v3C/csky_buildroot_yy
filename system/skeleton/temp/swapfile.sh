#!/bin/bash

sudo touch /opt/swapfile
# create 128M swap file
sudo dd if=/dev/zero of=/opt/swapfile bs=4M count=32
sudo mkswap /opt/swapfile
# swap on the swapfile
sudo swapon -a /opt/swapfile
# check the swap created or not
free

## after used the swap file, you can swapoff -a to clear the swap file
#swapoff -a
# Then re-swapon -a /opt/swapfile
#sudo swapon -a /opt/swapfile
