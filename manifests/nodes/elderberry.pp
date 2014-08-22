#
# Elderberry is our host
#
node elderberry {
	include service::ntpd
	include service::iptables
	include service::puppet

	remotefolder {
		'/etc/netctl/': ;
		'/etc/sysctl.d': ;
		'/etc/system.d/system': ;
		'/usr/share/lxc/templates': ;
	}
}