class user::sk {
	group {
		'sk':
			ensure => present;
	}

	user {
		'sk':
			ensure     => present,
			gid        => 'sk',
			groups     => ['sk', 'sudo'],
			shell      => '/bin/bash',
			require    => Group['sudo', 'sk'],
			comment    => 'Skylar Kelty',
			managehome => true;
	}
}
