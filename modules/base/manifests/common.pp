#
# A set of common includes for most VMs.
#
class base::common {
	include base::hosts
	include base::sudo

	if $hostname != 'apple' {
		include service::puppet
	}
	include service::sshd

	include user::sk

	include packages::base
	include packages::vim
}