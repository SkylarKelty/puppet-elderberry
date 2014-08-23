#
# A set of common includes for most VMs.
#
class base::common {
	include base::hosts
	include base::sudo
	include service::puppet
	include service::sshd
}