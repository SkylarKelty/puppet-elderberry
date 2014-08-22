#
# Elderberry is our host
#
node elderberry {
	include service::ntpd
	include service::iptables
	include service::puppet
}