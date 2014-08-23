class service::sshd {
    package {
        'openssh':
            ensure => present;
    }

    service {
        'sshd':
            ensure => true,
            enable => true,
            require => Package['openssh'];
    }

    file {
        '/etc/ssh/sshd_config':
            ensure => present,
            source => 'puppet:///modules/service/sshd_config',
            require => Package['openssh'],
            notify => Service['sshd'];

        '/etc/ssh/sshd_banner':
            ensure => present,
            content => template('service/banner.erb');
    }
}