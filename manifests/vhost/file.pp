define nginx::vhost::file(
  $ensure = present
) {
  include nginx
  nginx::configfile{"conf.d/$name":
    ensure => $ensure,
  }
}
