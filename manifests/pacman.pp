#
# Updates all puppeted servers once a day.
#

schedule {
	'daily':
    	period => daily;
}

stage {
	'preinstall':
    	before => Stage['main'];
}

class pacman_update {
    exec {
    	'/usr/bin/pacman -Syyuu --noconfirm':
        	schedule => 'daily';
    }
}

class {
	'pacman_update':
   		stage => preinstall;
}
