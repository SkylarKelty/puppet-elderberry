class service::mariadb {
    package {
        'mariadb':
            ensure => present;
    }

    service {
        'mysqld':
            enable => true,
            ensure => running,
            require => Package['mariadb'];
    }
}
