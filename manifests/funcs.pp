#
# A couple of handy utilities
#

#
# Pull a specific file out of a host's folder.
#
define remotefile($host = $hostname, $owner = root, $group = root, $mode = '0644', $ensure = 'present') {
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
# Sync a folder.
#
define remotefolder($directory = $title, $host = $hostname, $owner = root, $group = root, $purge = false) {
    file {
        $directory:
            ensure => directory,
            source => "puppet://apple/files/$host$directory",
            recurse => true,
            owner => $owner,
            group => $group,
            purge => $purge;
    }
}
