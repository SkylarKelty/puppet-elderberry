#
# A set of common includes for most VMs.
#
class base::common {
	include base::hosts
	include service::puppet
}