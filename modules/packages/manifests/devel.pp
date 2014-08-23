class packages::devel {
	package {
		[
			'autoconf',
			'automake',
			'binutils',
			'bison',
			'fakeroot',
			'file',
			'findutils',
			'flex',
			'gawk',
			'gcc',
			'gettext',
			'grep',
			'groff',
			'gzip',
			'libtool',
			'm4',
			'make',
			'pacman',
			'patch',
			'sed',
			'texinfo',
			'which'
		]:
			ensure => present;
	}
}
