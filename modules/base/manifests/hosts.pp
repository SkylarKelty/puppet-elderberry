class base::hosts {
	host {
		#
		# VM Hosts
		#
		'terra':
			comment => 'VM Host',
			ip => '217.169.22.166',
			host_aliases => ['terra.xand.co.uk', 'terra.skelty.uk'];

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
		'strawberry':
			comment => 'Web Core 1 (Apache/PHP)',
			ip => '10.1.0.11';
		'blackberry':
			comment => 'Web Core 2 (Apache/PHP)',
			ip => '10.1.0.12';
		'pineberry':
			comment => 'Gitlab',
			ip => '10.1.0.13';
		'gooseberry':
			comment => 'Redmine',
			ip => '10.1.0.14';
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