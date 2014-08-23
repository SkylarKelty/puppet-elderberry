class base::hosts {
	host {
		#
		# VM Hosts
		#
		'elderberry.xand.co.uk':
			comment => 'VM Host',
			ip => '172.31.2.176',
			host_aliases => 'elderberry';

		#
		# Base Servers
		#
		'apple':
			comment => 'Puppet Master',
			ip => '10.1.0.2';
		'lemon':
			comment => 'SSH Gateway',
			ip => '10.1.0.3';

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