class php {
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
		require => Exec["apt-update"]
	}

	service { "php5-fpm":
		ensure => running,
		enable => true,
		require => Package["php5-fpm"],
	}
}
