class service::iptables {
	package {
		'iptables':
			ensure => present;
	}

	service {
		'iptables':
			ensure => true,
			enable => true,
			require => Package['iptables'];
	}
}