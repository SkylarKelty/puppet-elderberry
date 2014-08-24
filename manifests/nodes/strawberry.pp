#
# Strawberry is a standard web server
#
node strawberry {
	include base::common
	include apache::server
	include apache::php
	include apache::standard
}
