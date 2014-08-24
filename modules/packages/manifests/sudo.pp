class packages::sudo {
	group {
		'sudo':
			ensure => present;
	}

	package {
		'sudo':
			ensure => present;
	}

	file {
		'/etc/sudoers.d/groups.conf':
			ensure => absent;

		'/etc/sudoers.d/5-groups':
			ensure => present,
			source => 'puppet:///modules/packages/sudo/groups';
	}
}
