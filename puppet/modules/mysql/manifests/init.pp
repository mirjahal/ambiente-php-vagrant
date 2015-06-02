class mysql {
	file { "/etc/mysql/my.cnf":
		group => "root",
		mode => 644,
		source  => "puppet:///modules/mysql/my.cnf",
		require => Package["mysql-server"],
		notify  => Service["mysql"],
	}
	
	exec { "create-user-mysql":
        command => "/usr/bin/mysql -uroot -e \"GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;\"",
        require => Service["mysql"]
    }

	package { [
			"mysql-server", 
			"mysql-client"
		]:
		ensure => installed,
		require => Exec["apt-update"]
	}

	service { "mysql":
		ensure => running,
		enable => true,
		require => Package["mysql-server"],
	}
}
