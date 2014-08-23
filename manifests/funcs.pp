#
# A couple of handy utilities
#

#
# Pull a specific file out of a host's folder.
#
define remotefile($realname = $title, $host = $hostname, $owner = root, $group = root, $mode = '0644', $ensure = 'present') {
    file {
        $realname:
            mode => $mode,
            owner => $owner,
            group => $group,
            source => "puppet://apple/files/$host/$name",
            ensure => $ensure
    }
}
