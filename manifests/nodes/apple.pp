#
# Apple is our Puppet master.
#
node apple {
	include apache::server
	include apache::passenger

	class {
		'service::puppet':
			master => true;
	}

	vcsrepo {
		'/opt/puppet-elderberry':
			ensure   => latest,
			provider => git,
			source   => 'https://github.com/SkylarKelty/puppet-elderberry.git';
	}

	file {
		'/etc/puppet/files':
			ensure => link,
			target => '/opt/puppet-elderberry/files';

		'/etc/puppet/manifests':
			ensure => link,
			target => '/opt/puppet-elderberry/manifests';

		'/etc/puppet/modules':
			ensure => link,
			target => '/opt/puppet-elderberry/modules';

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

	remotefolder {
		'/etc/httpd/conf.d/': ;
		'/etc/puppet': ;
	}
}
