#
# Pumpkin is our NGINX router
#
node pumpkin {
	include base::common
	include service::nginx

	remotefile {
		'/etc/nginx/conf.d/dashboard.skelty.uk.conf':
			notify => Service['nginx'];
	}
}
