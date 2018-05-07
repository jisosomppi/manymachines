## Jussi Isosomppi, 2018
## Sources:
## https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one
## https://www.vagrantup.com/docs/virtualbox/boxes.html
## https://stackoverflow.com/questions/22523134/running-remote-commands-after-vagrant-ssh

cd
mkdir vagrant
cd vagrant/

# initialize new base box
wget https://raw.githubusercontent.com/jisosomppi/manymachines/master/Vagrantfile_base
cp Vagrantfile_base Vagrantfile
vagrant up

# create new box and make it usable
vagrant package --output rdyslave.box
vagrant box add rdyslave rdyslave.box

# remove base box
vagrant destroy -f
rm Vagrantfile

cd
