cd
mkdir vagrant
cd vagrant/

# initialize new base box
vagrant init minimal/trusty64
vagrant up

# run commands inside box
vagrant ssh -- -t 'sudo apt-get update; sudo apt-get install -y salt-minion; echo -e "\nmaster: 172.28.171.118\n" | sudo tee -a /etc/salt/minion; sudo apt-get clean; cat /dev/null > ~/.bash_history && history -c && exit'

# create new box and make it usable
vagrant package --output rdyslave.box
vagrant box add rdyslave rdyslave.box

# allow use of 
vagrant destroy
rm Vagrantfile
