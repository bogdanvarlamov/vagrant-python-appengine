class php {

    $modules = [
        'php5',
        'php5-cli',
        'php5-curl',
        'php5-dev',
        'php5-fpm',
        'php5-gd',
        'php5-imagick',
        'php5-mcrypt',
        'php5-mysql',
        'php5-pspell',
        'php5-tidy',
        'php5-xdebug',
        'php5-xmlrpc',
        'php5-xsl',
        'php-pear'
    ]

    package { $modules:
        ensure => present;
    }

    exec { 'phpunit':
        command => "pear upgrade PEAR && \
                    pear config-set auto_discover 1 && \
                    pear install --alldeps pear.phpunit.de/PHPUnit",
        creates => '/usr/bin/phpunit',
        path    => ['/bin', '/usr/bin'],
        require => Package['php-pear'];
    }

}