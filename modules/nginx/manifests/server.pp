class nginx::server {
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
			source => 'puppet:///modules/nginx/nginx.conf',
			notify => Service['nginx'];

		'/etc/nginx/conf.d/5-upstream.conf':
			ensure => present,
			source => 'puppet:///modules/nginx/conf.d/5-upstream.conf',
			notify => Service['nginx'];
	}
}
