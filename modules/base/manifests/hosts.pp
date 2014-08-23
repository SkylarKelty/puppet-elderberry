class base::hosts {
	host {
		#
		# VM Hosts
		#
		'elderberry':
			comment => 'VM Host',
			ip => '217.169.22.166',
			host_aliases => ['elderberry.xand.co.uk', 'elderberry.skelty.uk'];

		#
		# Base Servers
		#
		'apple':
			comment => 'Puppet Master',
			ip => '10.1.0.2';
		'lemon':
			comment => 'SSH Gateway',
			ip => '10.1.0.3',
			host_aliases => 'lemon.skelty.uk';

		#
		# Web Servers
		#
		'pumpkin':
			comment => 'Web Router (NGINX)',
			ip => '10.1.0.10';
		'cranberry':
			comment => 'Puppet Dashboard',
			ip => '10.1.0.15';

		#
		# Data Servers
		#
		'kiwi':
			comment => 'MariaDB',
			ip => '10.1.0.21';
	}
}