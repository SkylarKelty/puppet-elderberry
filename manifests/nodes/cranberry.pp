#
# Cranberry is our Puppet dashboard.
#
node cranberry {
	include base::common
	include apache::server
	include apache::passenger
	include packages::devel

	package {
		['libmariadbclient', 'libxml2', 'libxslt', 'postgresql-libs', 'nodejs']:
			ensure => present;
	}

	service {
		'puppetdwd':
			ensure => true,
			enable => true;
	}

	vcsrepo {
		'/opt/puppet-dashboard':
			ensure   => latest,
			provider => git,
			source   => 'https://github.com/sodabrew/puppet-dashboard.git';
	}

	remotefile {
		'/etc/httpd/conf.d/puppetdashboard.conf': ;
		'/usr/lib/systemd/system/puppetdwd.service': ;

		'/usr/bin/puppetdwd':
			mode => 0755;
	}
}
