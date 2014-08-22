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
}