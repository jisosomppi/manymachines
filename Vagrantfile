# Multislave vagrant for Puppet
# Copyright 2017 Tero Karvinen http://TeroKarvinen.com
# Original source: http://terokarvinen.com/2017/provision-multiple-virtual-puppet-slaves-with-vagrant
# Loop logic: https://github.com/Tommi852/slavearmy/blob/master/raportti.md#raportti-orja-koneiden-teosta
# Modified for salt by Jussi Isosomppi, 2018

$tscript = <<TSCRIPT

echo -e 'Acquire::http::proxy "http://172.28.171.222:8000";\nAcquire::https::proxy "http://172.28.171.222:8000";' \
 > '/etc/apt/apt.conf.d/30proxy'
cat /etc/apt/apt.conf.d/30proxy

apt-get update
apt-get -y install salt-minion
echo -e "\nmaster: 172.28.171.222\n" | sudo tee -a /etc/salt/minion
sudo service salt-minion restart
TSCRIPT

Vagrant.configure(2) do |config|
	config.vm.box = "minimal/trusty64"
	config.vm.provision "shell", inline: $tscript
	config.vm.usable_port_range = (2200..20000)

	r = rand(36**6).to_s(36)
	(1..10).each do |i| ## 16Gb RAM = Xubuntu install + 60 VM's with 1Gb to spare for stability
		config.vm.define "slave#{i}" do |slave|
			slave.vm.hostname = "Rem-#{r}-Slave#{i}"
			slave.vm.network :forwarded_port, guest: 22, host: 50000+i, id: 'ssh'
		slave.vm.provider "virtualbox" do |vb|
			vb.memory = 128
			vb.linked_clone = true
			vb.customize ["modifyvm", :id, "--usb", "on"]
			vb.customize ["modifyvm", :id, "--usbehci", "off"]
		end
		end
	end
end
