class packages::vim {
	package {
		'vim':
			ensure => present;
	}

	file {
		'/etc/vimrc':
			ensure => present,
			source => 'puppet:///modules/packages/vim/vimrc';
	}
}