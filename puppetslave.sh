#This is a startup script for assimilating new physical computers
#Jussi Isosomppi, 2017

setxkbmap fi
sudo apt-get update
sudo apt-get install -y git puppet virtualbox vagrant

cd

git config --global user.name "Jussi Isosomppi"
git config --global user.email "jussi.isosomppi@gmail.com"
git config --global credential.helper "cache --timeout=3600"
git config --global push.default simple

git clone https://github.com/jisosomppi/manymachines

#adding my git sync script
sudo cp manymachines/gitup /usr/local/bin/
sudo chmod 755 /usr/local/bin/gitup

#setting up vagrant
mkdir vagrant
cp manymachines/Vagrantfile vagrant/
cd vagrant
vagrant up
