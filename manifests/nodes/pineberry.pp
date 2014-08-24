#
# Pineberry is a Gitlab server
#
node pineberry {
	include base::common
	include apache::server

	remotefile {
		'/etc/httpd/conf.d/50-gitlab.conf': ;
	}
}
