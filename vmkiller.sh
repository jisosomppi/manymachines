# Script for destroying all existing Vagrant machines
# Jussi Isosomppi, 2018

for i in `vagrant global-status | grep virtualbox | awk '{ print $1 }'` ; do vagrant destroy $i ; done
