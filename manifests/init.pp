class nginx {
  package{'nginx':
    ensure => installed,
  }
  service{'nginx':
    ensure => running,
    enable => true,
    hasstatus => false, 
    require => Package['nginx'],
  }
  nginx::configfile{[
    'nginx.conf',
  ]:}
}
