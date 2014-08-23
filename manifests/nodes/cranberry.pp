#
# Cranberry is our Puppet dashboard.
#
node cranberry {
	include base::common
	include apache::server
	include apache::passenger
}
