class nodejs {
	exec { "add-nodejs-ppa":
		command => "/usr/bin/add-apt-repository ppa:chris-lea/node.js",
		notify => Exec["apt-update"]
	}
	
	exec { "install-bower":
		command => "/usr/bin/npm install -g bower",
		require => [
			Package["nodejs"], 
			Package["git"]	
		],
	}
	
	exec { "install-gulp":
		command => "/usr/bin/npm install -g gulp",
		require => Package["nodejs"]
	}

	package { [
			"nodejs"
		]:
		ensure => installed,
		require => Exec["add-nodejs-ppa"]
	}
}
