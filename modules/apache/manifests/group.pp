# 
# Defines a PHP Group
#
define apache::group ($groupname = $title) {
	user {
		"$groupname":
			ensure => present,
			gid => 'pkg';
	}

	file {
		"/srv/http/fcgi-bin.d/$groupname":
			ensure  => 'directory',
			require => File['/srv/http/fcgi-bin.d'];

		"/srv/http/fcgi-bin.d/$groupname/php-default":
			ensure  => 'present',
			owner   => $groupname,
			group   => 'pkg',
			content => template('apache/php-default.erb'),
			require => File["/srv/http/fcgi-bin.d/$groupname"],
			mode 	=> 0755;
	}
}
