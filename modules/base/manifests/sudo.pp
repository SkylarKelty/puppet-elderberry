class base::sudo {
	group {
		'sudo':
			ensure => present;
	}

	package {
		'sudo':
			ensure => present;
	}
}
