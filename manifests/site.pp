# Defaults

Exec { path => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin' }

# Imports
import 'funcs.pp'
import 'pacman.pp'
import 'nodes/*.pp'

remotehost {
	$hostname: ;
}
