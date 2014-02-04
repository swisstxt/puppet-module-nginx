class nginx (
  $package = 'nginx',
  $service = 'nginx',
  $manage = [
    'nginx.conf',
    'mime.types',
  ],
  $purge_vhosts = false,
) {
  package { $package:
    ensure => present,
    alias  => 'nginx',
  } ->
  service { $service:
    ensure    => running,
    enable    => true,
    hasstatus => false,
  }
  if $purge_vhosts {
    file { '/etc/nginx/conf.d':
      recurse => true,
      purge   => true,
    }
  }
  ::nginx::configfile { $manage:
    source_module => $caller_module_name,
  }
}
