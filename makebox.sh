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

# customize base box
vagrant ssh -- -t 'sudo apt-get update; sudo apt-get install -y salt-minion; sudo service salt-minion stop; sudo rm /etc/salt/minion; echo "master: 172.28.171.118" | sudo tee /etc/salt/minion; sudo service salt-minion start; sudo apt-get clean; cat /dev/null > ~/.bash_history && history -c && exit'

# create new box and make it usable
vagrant package --output rdyslave.box
vagrant box add rdyslave rdyslave.box

# remove base box
vagrant destroy
rm Vagrantfile
