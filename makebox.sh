## Jussi Isosomppi, 2018
## Script for making a custom Vagrant box based on an existing one
## Sources:
## https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one
## https://www.vagrantup.com/docs/virtualbox/boxes.html

cd
mkdir vagrant

# move premade basebox Vagrantfile and rename it
cp ~/manymachines/Vagrantfile_basebox ~/vagrant/Vagrantfile
cd ~/vagrant/

# initialize new base box
vagrant up

# create new box and make it usable
vagrant package --output rdyslave.box
vagrant box add rdyslave rdyslave.box

# remove base box and its Vagrantfile to make room for actual VMs
vagrant destroy -f
rm Vagrantfile

cd
