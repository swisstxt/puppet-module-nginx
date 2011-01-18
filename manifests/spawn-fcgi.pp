class nginx::spawn-fcgi {
  package{'spawn-fcgi':
    ensure => installed,
  }
  service{'spawn-fcgi':
    enable => true,
    ensure => running,
    hasstatus => true,
    require => [
      Package['spawn-fcgi'],
      File['/etc/sysconfig/spawn-fcgi'],
    ],
  }
  file{'/etc/sysconfig/spawn-fcgi':
    source =>  [
      "puppet://$server/modules/site-nginx/spawn-fcgi.sysconfig",
      "puppet://$server/modules/nginx/spawn-fcgi.sysconfig",
    ],
    notify => Service['spawn-fcgi'],
    owner => root, group => root, mode => 0444;
  }
}
