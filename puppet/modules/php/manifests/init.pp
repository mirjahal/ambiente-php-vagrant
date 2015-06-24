class php {
	exec { "add-php56-ppa":
		command => "/usr/bin/add-apt-repository ppa:ondrej/php5-5.6",
		notify => Exec["apt-update"]
	}

	package { [
			"php5", 
			"php5-cli",
			"php5-fpm",
			"php5-dev", 
			"php5-mcrypt", 
			"php5-curl", 
			"php5-gd", 
			"php5-memcached",
			"php5-mysql",
			"php5-pgsql",
			"php5-xdebug",
			"libapache2-mod-php5",
			"php-pear"
		]:
		ensure => installed,
		require => [
			Package["python-software-properties"],
			Exec["add-php56-ppa"]
		]
	}

	service { "php5-fpm":
		ensure => running,
		enable => true,
		require => Package["php5-fpm"],
	}
}
