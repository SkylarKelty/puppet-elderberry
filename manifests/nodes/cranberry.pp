#
# Cranberry is our Puppet dashboard.
#
node cranberry {
	include base::common
	include apache::server
	include apache::passenger
	include packages::devel

	vcsrepo {
		'/opt/puppet-dashboard':
			ensure   => latest,
			provider => git,
			source   => 'https://github.com/sodabrew/puppet-dashboard.git';
	}
}
