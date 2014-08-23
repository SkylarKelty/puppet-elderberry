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
		['/etc/nginx/conf.d', '/var/log/nginx']:
			ensure => directory;

		'/etc/nginx/nginx.conf':
			ensure => present,
			source => 'puppet:///modules/service/nginx.conf',
			notify => Service['nginx'];
	}
}
