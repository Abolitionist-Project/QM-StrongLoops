#StrongNode & Mongodb with Ubuntu precise 64 VirtualBox - Vagrant

###How to Use
1. Download and install VirtualBox by [clicking here](https://www.virtualbox.org/wiki/Downloads)
2. Download and install Vagrant by [clicking here](http://downloads.vagrantup.com/)
3. Clone this repository.
4. cd QM-StrongLoops/
5. vagrant up

###After Vagrant Box is up
1. Vagrantfile configures private network at http://33.33.33.10/
3. login into the machine via 'vagrant ssh'
4. from cli start your node app with 'slc run' within the `quantimodo` folder

###Further Reading
- [StrongLoop](http://StrongLoop.com)
- [Vagrant Documentation](http://docs.vagrantup.com/v2/getting-started/index.html)
- [MongoDB](http://mongodb.org)