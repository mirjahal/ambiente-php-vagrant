class utils {
	exec { "enmod-mcrypt":
		command => "php5enmod mcrypt && php --ini",
		path => "/usr/local/bin/:/bin/:/usr/bin/:/usr/sbin/",
		require => [
			Package["php5-fpm"], 
			Package["php5-mcrypt"]	
		],
		notify => Service["php5-fpm"],
	}

	exec { "install-composer":
		command => "/usr/bin/curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin/",
		require => [
			Package["php5"],
			Package["curl"]
		]
	}

	package { [
			"curl",
			"libcurl3",
			"libcurl3-dev",
			"mcrypt",
			"imagemagick",
			"git",
			"python-software-properties"
		]:
		ensure => installed,
		require => Exec["apt-update"]
	}
}
