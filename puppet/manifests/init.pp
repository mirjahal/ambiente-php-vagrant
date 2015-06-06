exec { "apt-update":
	command => "/usr/bin/apt-get update"
}

include apache, mysql, php, postgresql, utils, nodejs
