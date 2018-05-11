## Startup script for setting up bare metal computers as Vagrant+Salt -slave colonies
## Jussi Isosomppi, 2018

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install git vagrant virtualbox ssh

cd
git clone https://github.com/jisosomppi/manymachines.git
cd ~/manymachines/

# Run script to setup new basebox with updated packages and salt-minion with correct master IP
bash makebox.sh

# Run script to setup masses of Vagrant VM's using new box
bash clonebox.sh
