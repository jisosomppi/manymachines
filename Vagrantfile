# Multislave vagrant for Puppet
# Copyright 2017 Tero Karvinen http://TeroKarvinen.com

$tscript = <<TSCRIPT
set -o verbose
echo "See you on http://TeroKarvinen.com"
apt-get update
apt-get -y install puppet
grep ^server /etc/puppet/puppet.conf || echo -e "\n[agent]\nserver=puppetmaster\n" |sudo tee -a /etc/puppet/puppet.conf
grep puppetmaster /etc/hosts || echo -e "\n172.28.171.215 puppetmaster\n"|sudo tee -a /etc/hosts
puppet agent --enable
sudo service puppet start
sudo service puppet restart
TSCRIPT

Vagrant.configure(2) do |config|

 config.vm.box = "minimal/xenial64"
 config.vm.provision "shell", inline: $tscript

 config.vm.define "slave01" do |slave01|
 slave01.vm.hostname = "slave01"
 end

 config.vm.define "slave02" do |slave02|
 slave02.vm.hostname = "slave02"
 end

end
