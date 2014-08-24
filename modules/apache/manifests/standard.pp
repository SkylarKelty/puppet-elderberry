class apache::standard {
	group {
		'w3':
			ensure => present;
	}

	user {
		'w3admin':
			ensure     => present,
			gid        => 'w3',
			groups     => ['w3'],
			shell      => '/bin/bash',
			require    => Group['w3'],
			comment    => 'Deployer of all things',
			managehome => true;
	}

	file {
		'/etc/httpd/conf.d/15-which.conf':
			ensure => present,
			source => 'puppet:///modules/apache/which.conf',
			notify => Service['httpd'];

		'/etc/httpd/conf.d/15-apache-webcore.conf':
			ensure => present,
			source => 'puppet:///modules/apache/apache-webcore.conf',
			notify => Service['httpd'];
	}

	file {
		'/var/log/www':
			ensure => 'directory',
			owner => 'http';

		'/var/www':
			ensure => 'directory';

		'/var/www/vhosts':
			ensure => 'directory',
			require => File['/var/www'];

		'/var/www/vhosts/which.html':
			ensure  => present,
			content => template('apache/which.html.erb'),
			require => File['/var/www/vhosts'];
	}
}
