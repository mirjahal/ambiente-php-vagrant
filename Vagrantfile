VAGRANTFILE_API_VERSION = "2"

# If hostsupdater plugin is installed, add all server names as aliases.
unless Vagrant.has_plugin?("vagrant-hostsupdater")
  raise "É necessário instalar o plugin 'vagrant-hostsupdater' através do comando: vagrant plugin install vagrant-hostsupdater"
end

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

    #=========================================================================
    #=========================================================================
    #=========== Obrigatorio ======>  sudo visudo <===========================
    #=========================================================================
    #=========================================================================
    # Allow passwordless startup of Vagrant with vagrant-hostsupdater.
    #Cmnd_Alias VAGRANT_HOSTS_ADD = /bin/sh -c echo "*" >> /etc/hosts
    #Cmnd_Alias VAGRANT_HOSTS_REMOVE = /usr/bin/sed -i -e /*/ d /etc/hosts
    #%admin ALL=(root) NOPASSWD: VAGRANT_HOSTS_ADD, VAGRANT_HOSTS_REMOVE
    #=========================================================================
    #=========================================================================
    #=========================================================================
    #=========================================================================


    # If hostsupdater plugin is installed, add all server names as aliases.
    if Vagrant.has_plugin?("vagrant-hostsupdater")
      # Add all hosts that aren't defined as Ansible vars.
      config.hostsupdater.aliases = []
      config.hostsupdater.aliases.push("desenv.dev")
    end

    config.vm.synced_folder "projetos", "/var/www/html", id: "vagrant-root"

    config.vm.provision "puppet" do |puppet|
        puppet.module_path = "puppet/modules"
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file  = "init.pp"
    end
end
