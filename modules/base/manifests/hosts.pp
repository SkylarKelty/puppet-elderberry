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

		#
		# Web Servers
		#
		'cranberry':
			comment => 'Puppet Dashboard',
			ip => '10.1.0.15';
	}
}