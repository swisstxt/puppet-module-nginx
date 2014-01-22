class nginx (
  $package = 'nginx',
  $service = 'nginx',
  $manage = [
    'nginx.conf',
    'mime.types',
  ],
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
  ::nginx::configfile { $manage:
    source_module => $caller_module_name,
  }
}
