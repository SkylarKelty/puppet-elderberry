#
# Apple is our Puppet master.
#
node apple {
	include apache::server
}