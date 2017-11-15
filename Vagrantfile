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
	config.vm.box = "minimal/trusty64"
	config.vm.provision "shell", inline: $tscript
	config.vm.usable_port_range = (2200..20000)

	r = rand(36**10).to_s(36)
	(1..50).each do |i|
		config.vm.define "slave#{i}" do |slave|
			slave.vm.hostname = "150mb-#{r}-Slave#{i}"
			slave.vm.network :forwarded_port, guest: 22, host: 50000+i, id: 'ssh'
		slave.vm.provider "virtualbox" do |vb|
			vb.memory = 150
			vb.linked_clone = true
			vb.customize ["modifyvm", :id, "--usb", "on"]
			vb.customize ["modifyvm", :id, "--usbehci", "off"]
		end
		end
	end
end
