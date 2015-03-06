Vagrant.configure("2") do |config|
    config.vm.box = "hashicorp/precise64"
    config.vm.network "forwarded_port", guest: 59045, host: 59045
    config.vm.network "forwarded_port", guest: 51230, host: 51230
    config.vm.network "forwarded_port", guest: 7777, host: 7777
    config.vm.network "forwarded_port", guest: 3000, host: 3000

    config.vm.provision :shell, :path => "node-strongloop-bootstrap.sh"

    # Assign this VM to a host-only network IP, allowing you to access it
    # via the IP. Host-only networks can talk to the host machine as well as
    # any other machines on the same network, but cannot be accessed (through this
    # network interface) by any external networks.
    config.vm.network :private_network, ip: '33.33.33.10'

    config.vm.provider :virtualbox do |vb|
        vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
        vb.customize ["modifyvm", :id, "--memory", "512"]
    end
end
