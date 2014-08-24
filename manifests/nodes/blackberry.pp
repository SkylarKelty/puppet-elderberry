#
# Blackberry is a standard web server
#
node blackberry {
	include base::common
	include apache::server
	include apache::php
	include apache::standard
}
