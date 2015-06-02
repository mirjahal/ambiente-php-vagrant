class postgresql {
	file { "/etc/postgresql/9.3/main/postgresql.conf":
		group => "postgres",
		owner => "postgres",
		mode => 644,
		source  => "puppet:///modules/postgresql/postgresql.conf",
		require => Package["postgresql"],
		notify  => Service["postgresql"],
	}

	file { "/etc/postgresql/9.3/main/pg_hba.conf":
		group => "postgres",
		owner => "postgres",
		mode => 640,
		source  => "puppet:///modules/postgresql/pg_hba.conf",
		require => Package["postgresql"],
		notify  => Service["postgresql"],
	}

	package { [
			"postgresql",
			"postgresql-client"
		]:
		ensure => installed,
		require => Exec["apt-update"]
	}

	service { "postgresql":
		ensure => running,
		enable => true,
		require => Package["postgresql"],
	}
}
