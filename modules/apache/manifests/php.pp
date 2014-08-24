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
			source => 'puppet:///modules/apache/apache-fcgid.conf',
			require => Package['apache', 'mod_fcgid'],
			notify => Service['httpd'];

		'/etc/php/php.ini':
			ensure  => present,
			source => 'puppet:///modules/apache/php.ini',
			require => Package['php'],
			notify => Service['httpd'];

		'/etc/php/conf.d/10-modules.ini':
			ensure => present,
			source => 'puppet:///modules/apache/php-modules.ini',
			require => Package['php'],
			notify => Service['httpd'];

		'/etc/php/conf.d/20-defaults.ini':
			ensure => present,
			source => 'puppet:///modules/apache/php-defaults.ini',
			require => Package['php'],
			notify => Service['httpd'];

		'/etc/php/conf.d/50-mongo.ini':
			ensure => present,
			source => 'puppet:///modules/apache/php-mongo.ini',
			require => Package['php'],
			notify => Service['httpd'];

		'/srv/http/fcgi-bin.d':
			ensure => 'directory',
			require => Package['apache'];

		# Package managers install these, we want to use the numbering
		# scheme though.
		[
			'/etc/php/conf.d/geoip.ini',
			'/etc/php/conf.d/memcached.ini',
			'/etc/php/conf.d/memcache.ini',
			'/etc/php/conf.d/mongo.ini'
		]:
			ensure => absent;
	}
}
