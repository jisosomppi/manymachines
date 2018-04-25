#This is a startup script for creating masses of salt minions
#Jussi Isosomppi, 2017

cd

setxkbmap fi
sudo apt-get update
sudo apt-get install -y git virtualbox vagrant squid-deb-proxy

git config --global user.name "Jussi Isosomppi"
git config --global user.email "jussi.isosomppi@gmail.com"
git config --global credential.helper "cache --timeout=3600"
git config --global push.default simple

git clone https://github.com/jisosomppi/manymachines

#setting up vagrant
mkdir vagrant
cp manymachines/Vagrantfile vagrant/
cd vagrant
vagrant up
