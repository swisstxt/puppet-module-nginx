class nginx (
  $package_name = 'nginx',
  $service = 'nginx',
  $manage = [
    'nginx.conf',
    'mime.types',
  ],
  $confd_purge = false,
) {
  package { $package_name:
    ensure => present,
    alias  => 'nginx',
  } ->
  service { $service:
    ensure    => running,
    enable    => true,
    hasstatus => false,
  }
  if $confd_purge {
    file { '/etc/nginx/conf.d':
      recurse => true,
      purge   => true,
    }
  }
  ::nginx::configfile { $manage:
    source_module => $caller_module_name,
  }
}
