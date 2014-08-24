define nginx::route (
	$subdomain = $title,
	$server = 'webcore'
) {
	file {
        "/etc/nginx/conf.d/20-$subdomain.skelty.uk.conf":
            ensure => present,
            content => template('nginx/route.erb'),
            notify => Service['nginx'];
	}
}
