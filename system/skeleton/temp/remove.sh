#!/bin/bash

sed -i 's/.*-R csky:csky .*//' /etc/inittab
sed -i 's/.*\/temp.*//' /etc/inittab
sed -i 's/.*removeINIT.*//' /etc/inittab
