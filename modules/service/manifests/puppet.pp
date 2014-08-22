class service::puppet ($master = false) {

	# We probably have this...
	package {
		'puppet':
			ensure => present;
	}

	service {
		'puppet':
			ensure => true,
			enable => true,
			require => Package['puppet'];
	}

	file {
		'/etc/puppet/puppet.conf':
			ensure => present,
			content => template('service/puppet.conf.erb'),
			require => Package['puppet'],
			notify => Service['puppet'];
	}
}