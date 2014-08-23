#
# Elderberry is our host
#
node elderberry {
	include base::common
	include service::ntpd
	include service::iptables
	include service::puppet

	remotefile {
		'/etc/netctl/lxcbridge': ;
		'/etc/sysctl.d/40-ip-forward.conf': ;
		'/etc/system.d/system/network@.service': ;
		'/usr/share/lxc/templates/lxc-archlinux': ;
	}
}