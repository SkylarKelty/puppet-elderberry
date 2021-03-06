#
# Apple is our Puppet master.
#
node apple {
	include base::common
	include apache::server
	include apache::passenger

	class {
		'service::puppet':
			master => true;
	}

	vcsrepo {
		'/opt/puppet':
			ensure   => latest,
			provider => git,
			source   => 'gitlab@pineberry:sk/puppet.git';
	}

	file {
		'/etc/puppet/files':
			ensure => link,
			target => '/opt/puppet/files';

		'/etc/puppet/manifests':
			ensure => link,
			target => '/opt/puppet/manifests';

		'/etc/puppet/modules':
			ensure => link,
			target => '/opt/puppet/modules';

		[
			'/usr/share/puppet',
			'/usr/share/puppet/rack',
			'/usr/share/puppet/rack/puppetmasterd',
			'/usr/share/puppet/rack/puppetmasterd/public'
		]:
			ensure => directory;


		'/usr/share/puppet/rack/puppetmasterd/tmp':
			ensure => directory,
			owner => 'http';
	}

	remotefile {
		'/etc/httpd/conf.d/puppetd.conf':
			require => File['/etc/httpd/conf.d'],
			notify => Service['httpd'];

		['/etc/puppet/auth.conf', '/etc/puppet/autosign.conf', '/etc/puppet/fileserver.conf']:
			require => Package['puppet'],
			notify => Service['httpd'];

		'/usr/share/puppet/rack/puppetmasterd/config.ru':
			owner => 'puppet',
			group => 'puppet',
			require => File['/usr/share/puppet/rack/puppetmasterd'],
			notify => Service['httpd'];
	}
}
