#
# Pumpkin is our NGINX router
#
node pumpkin {
	include base::common
	include nginx::server

	nginx::route {
		'www': ;
		'dashboard':
			server => 'cranberry';
		'git':
			server => 'pineberry';
		'tracker':
			server => 'gooseberry';
	}
}
