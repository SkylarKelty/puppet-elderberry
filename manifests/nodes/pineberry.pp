#
# Pineberry is a Gitlab server
#
node pineberry {
	include base::common
	include apache::server

	remotefile {
		'/etc/httpd/conf.d/50-gitlab.conf': ;
	}

	service {
		'redis':
			ensure => true,
			enable => true;

		'gitlab-unicorn':
			ensure => true,
			enable => true;

		'gitlab-sidekiq':
			ensure => true,
			enable => true;
	}
}
