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
  file{'/etc/nginx/nginx.conf':
    source => [
        "puppet:///modules/site-nginx/$fqdn/nginx.conf",
        "puppet:///modules/site-nginx/nginx.conf",
        "puppet:///modules/nginx/nginx.conf",
    ],
    require => Package['nginx'],
    notify => Service['nginx'],
    owner => root, group => 0, mode => 0644,
  }
}
