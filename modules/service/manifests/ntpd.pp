class service::ntps {
	package {
		'ntp':
			ensure => present;
	}

	service {
		'ntpd':
			ensure => true,
			enable => true,
			require => Package['ntp'];
	}
}