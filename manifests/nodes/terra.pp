#
# Terra is our host
#
node terra {
	include base::common
	include service::ntpd
	include service::iptables
	include service::puppet

	remotefile {
		'/etc/netctl/lxcbridge': ;
		'/etc/sysctl.d/40-ip-forward.conf': ;
		'/usr/share/lxc/templates/lxc-archlinux':
			mode => 0755;
	}
}