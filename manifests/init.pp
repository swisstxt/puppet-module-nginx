class nginx (
  $nginx_package = 'nginx',
){
  package{$nginx_package:
    ensure => installed,
    alias  => 'nginx',
  }
  service{'nginx':
    ensure    => running,
    enable    => true,
    hasstatus => false,
    require   => Package['nginx'],
  }
  nginx::configfile{[
    'nginx.conf',
    'mime.types',
  ]:}
}
