#This is a startup script for creating masses of salt minions
#Jussi Isosomppi, 2017

cd

sudo apt-get update
sudo apt-get install -y git virtualbox vagrant squid-deb-proxy

git clone https://github.com/jisosomppi/manymachines

#setting up vagrant
mkdir vagrant
cp manymachines/Vagrantfile vagrant/
cd vagrant
vagrant up
