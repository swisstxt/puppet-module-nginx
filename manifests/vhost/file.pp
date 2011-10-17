define nginx::vhost::file(
  $ensure = present,
  $source = undef
) {
  include nginx
  nginx::configfile{"conf.d/$name":
    ensure => $ensure,
    source => $source,
  }
}
