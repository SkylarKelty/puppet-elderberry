class apache::server {
	package {
		'apache':
			ensure => present;
	}

	service {
		'httpd':
			ensure => true,
			enable => true,
			require => Package['apache'];
	}

	file {
		'/etc/httpd/conf.d':
			ensure => directory;

		'/etc/httpd/conf/httpd.conf':
			ensure => present,
			source => 'puppet:///modules/apache/httpd.conf',
			notify => Service['httpd'];
	}
}