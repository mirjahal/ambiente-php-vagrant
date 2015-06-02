class apache {
	package { "apache2":
		ensure => installed,
		require => Exec["apt-update"]
	}

	service { "apache2":
		ensure => running,
		enable => true,
		require => Package["apache2"],
	}
}
