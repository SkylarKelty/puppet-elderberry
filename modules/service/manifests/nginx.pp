class service::nginx {
	package {
		'nginx':
			ensure => present;
	}

	service {
		'nginx':
			ensure => true,
			enable => true,
			require => Package['nginx'];
	}

	file {
		'/etc/nginx/conf.d':
			ensure => directory;

		'/var/log/nginx':
			owner => 'http',
			ensure => directory;

		'/etc/nginx/nginx.conf':
			ensure => present,
			source => 'puppet:///modules/service/nginx.conf',
			notify => Service['nginx'];
	}
}
