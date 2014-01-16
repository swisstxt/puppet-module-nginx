class nginx (
  $package_name = 'nginx',
  $configfile = [
    'nginx.conf',
    'mime.types',
  ],
) {
  package { $package_name:
    ensure => present,
    alias  => 'nginx',
  } ->
  service { 'nginx':
    ensure    => running,
    enable    => true,
    hasstatus => false,
  }
  ::nginx::configfile { $configfile: }
}
