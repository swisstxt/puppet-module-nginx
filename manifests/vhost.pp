define nginx::vhost (
  $ensure  = present,
  $content = undef,
  $source  = undef,
) {
  include ::nginx
  nginx::configfile{"conf.d/$name":
    ensure  => $ensure,
    content => $content,
    source  => $source,
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
}
