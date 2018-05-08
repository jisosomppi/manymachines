# manymachines
An attempt to take over the world with numerous salt minions

Main repository available at: https://github.com/jisosomppi/mgmt


## Usage
Current method for creating new salt colonies is installing Xubuntu and running:

```
wget jisosomppi.me/deadsea.sh && bash deadsea.sh
```

The above script: 
* clones this repository
* installs required programs
* sets up a new base box for vagrant with:
  * updated packages
  * salt-minion installed
  * correct master IP and minion ID set up
* attempts to create 100 VMs per physical machine

## Base box
The base box is created with the script `basebox.sh` using a minimal/trusty64 (Ubuntu 14.04 with minimal clutter) VM as a base, which then gets updated packages so they only need to be fetched once per physical machine, instead of once per VM. The base box gets the packages from the master, which is also configured as an apt-deb-proxy. This saves tons of time in the creation of VMs, since the fetching of packages (even from the proxy) was taking most of the time while bringing up new VMs.

This VM is then packaged into a new base box, which is added to Vagrant so it can be reused.

## Making minions
After the base box is made, the next script (`clonebox.sh`) starts creating new VMs. These new installs already have all the needed packages, as well as the master IP address setup. For some reason though, the minion ID didn't automatically change the new hostname (Rem-_randomized string_-Slave _number_), so I just forced the deletion of the previous ID and checked that restarting the salt-minion service creates a new ID file (`/etc/salt/minion_id`). This is the smallest amount of commands in the provision script that I could think of, which will still give me functional salt-minions. This should lead to the fastest possible startup time per VM.

*Note: I thought about creating VMs simultaneously, but that's not a supported feature withing Virtualbox*

_Above URL is an easily memorable version of https://raw.githubusercontent.com/jisosomppi/manymachines/master/deadsea.sh_
