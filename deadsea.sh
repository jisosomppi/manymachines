## Startup script for setting up bare metal computers as Vagrant+Salt -slave colonies
## Jussi Isosomppi, 2018

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install git vagrant virtualbox ssh


# Run script to setup new basebox with updated packages and salt-minion with correct master IP
wget https://github.com/jisosomppi/manymachines/raw/master/makebox.sh
bash makebox.sh

# Run script to setup masses of Vagrant VM's using new box
wget https://github.com/jisosomppi/manymachines/raw/master/clonebox.sh
bash clonebox.sh
