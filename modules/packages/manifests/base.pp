class packages::base {
	package {
		['cronie', 'ruby', 'git', 'subversion', 'gnu-netcat']:
			ensure => present;
	}
}
