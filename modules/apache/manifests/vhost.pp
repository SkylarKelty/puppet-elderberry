# 
# Define's an FCGI-capable VHost
#
define apache::vhost (
	$subdomain = $title,
	$ensure = 'present'
) {
	$url = "$subdomain.skelty.uk"
	$webuser = "w3$subdomain"

	user {
		$webuser:
			ensure => $ensure,
			gid => 'w3';
	}

	if $ensure == 'present' {
		$directory_present = 'directory'
	} else {
		$directory_present = 'absent'
	}

	file {
		"/var/www/vhosts/$url":
			ensure  => $directory_present,
			force   => true,
			require => File['/var/www/vhosts'];

		"/var/www/vhosts/$url/public":
			ensure  => $directory_present,
			force   => true,
			owner   => 'w3admin',
			require => [File["/var/www/vhosts/$url"], User['w3admin']];

		"/var/www/vhosts/$url/app":
			ensure  => $directory_present,
			force   => true,
			owner   => 'w3admin',
			require => [File["/var/www/vhosts/$url"], User['w3admin']];

		"/var/www/vhosts/$url/writable":
			ensure  => $directory_present,
			force   => true,
			owner   => $webuser,
			group   => 'w3',
			require => File["/var/www/vhosts/$url"];

		"/var/www/vhosts/$url/writable/sessions":
			ensure  => $directory_present,
			force   => true,
			owner   => $webuser,
			group   => 'w3',
			require => File["/var/www/vhosts/$url/writable"];

		"/srv/http/fcgi-bin.d/$webuser":
			ensure  => $directory_present,
			force   => true,
			mode	=> 0755,
			owner	=> $webuser,
			group	=> 'w3',
			require => File['/srv/http/fcgi-bin.d'];

		"/srv/http/fcgi-bin.d/$webuser/php-default":
			ensure  => $ensure,
			owner   => $webuser,
			group   => 'w3',
			content => template('apache/php-default.erb'),
			require => File["/srv/http/fcgi-bin.d/$webuser"],
			mode 	=> 0755;

		"/var/log/www/$url":
			ensure  => $directory_present,
			force   => true,
			owner   => 'http',
			group   => 'http',
			require => File['/var/log/www'];

		"/etc/httpd/conf.d/20-$url.conf":
			ensure  => $ensure,
			content => template('apache/vhost.erb'),
			require => File['/etc/httpd/conf.d'],
			notify  => Service['httpd'];
	}
}
