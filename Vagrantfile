VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.network :private_network, ip: "192.168.57.102"
    config.vm.network "forwarded_port", guest: 80, host: 8080 #http
	config.vm.network :forwarded_port, guest: 3306, host: 3306 #mysql
	config.vm.network :forwarded_port, guest: 5432, host: 5432 #postgresql
    config.ssh.forward_agent = true
    config.vm.boot_timeout = 900

    config.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--memory", 512]	
    end

    config.vm.synced_folder "projetos", "/var/www/html", id: "vagrant-root"

	config.vm.provision "puppet" do |puppet|
		puppet.module_path = "puppet/modules"
		puppet.manifests_path = "puppet/manifests"
		puppet.manifest_file  = "init.pp"
	end
end
