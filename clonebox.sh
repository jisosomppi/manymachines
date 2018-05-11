## Script for setting up masses of Vagrant+salt slaves
## Jussi Isosomppi, 2018


# move premade Vagrantfile for clones and rename it
cd
cp ~/manymachines/Vagrantfile_rdyslave ~/vagrant/Vagrantfile
cd ~/vagrant/

# start creating 100 VMs
vagrant up
