class nginx (
  $nginx_package = 'nginx',
  $site_classes = undef
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
  if $site_classes {
    class{$site_classes:}
  }
}
