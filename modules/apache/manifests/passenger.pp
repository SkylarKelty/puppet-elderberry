class apache::passenger {
	package {
		'passenger':
			ensure => present;
	}

	file {
		'/etc/httpd/conf.d/10-passenger.conf':
			ensure => present,
			source => 'puppet:///modules/apache/passenger.conf',
			notify => Service['httpd'];
	}
}