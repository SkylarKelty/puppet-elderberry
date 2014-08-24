class apache::php {
	package {
		[
			'mod_fcgid',
			'php',
			'php-cgi',
			'php-mcrypt',
			'php-pear',
			'php-gd',
			'php-intl',
			'php-memcached',
			'php-memcache',
			'php-mongo',
			'php-pspell',
			'php-geoip',
			'php-xsl',
			'php-tidy',
			'graphviz'
		]:
			ensure => present,
			notify => Service['httpd'];
	}

	file {
		'/etc/httpd/conf.d/10-fcgid.conf':
			ensure => present,
			source => 'puppet:///modules/apache/fcgid.conf',
			require => Package['apache', 'mod_fcgid'],
			notify => Service['httpd'];

		'/etc/php/php.ini':
			ensure  => present,
			source => 'puppet:///modules/apache/php.ini',
			require => Package['php'],
			notify => Service['httpd'];

		'/etc/php/conf.d/10-modules.conf':
			ensure => present,
			source => 'puppet:///modules/apache/php-modules.conf',
			require => Package['php'],
			notify => Service['httpd'];

		'/etc/php/conf.d/20-defaults.conf':
			ensure => present,
			source => 'puppet:///modules/apache/php-defaults.conf',
			require => Package['php'],
			notify => Service['httpd'];

		'/srv/http/fcgi-bin.d':
			ensure => 'directory',
			require => Package['apache'];
	}
}
