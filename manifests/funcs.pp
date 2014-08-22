#
# A couple of handy utilities
#

#
# Pull a specific file out of a host's folder.
#
define remotefile($host = 'base', $owner = root, $group = root, $mode = '0644', $ensure = 'present') {
    file {
        $title:
            mode => $mode,
            owner => $owner,
            group => $group,
            source => "puppet://apple/files/$host/$name",
            ensure => $ensure
    }
}

#
# Pull everything from files/$host.
#
define remotehost($host = $title) {
    file {
        '/':
            ensure => directory,
            source => "puppet://apple/files/$folder",
			recurse => 'remote';
    }
}
