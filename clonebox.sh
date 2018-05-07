## Script for setting up masses of Vagrant+salt slaves
## Jussi Isosomppi, 2018

cd
cd vagrant/
wget https://raw.githubusercontent.com/jisosomppi/manymachines/master/Vagrantfile_rdyslave
cp Vagrantfile_rdyslave Vagrantfile
vagrant up
