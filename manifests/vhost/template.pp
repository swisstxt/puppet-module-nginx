define nginx::vhost::template(
  $ensure = present,
) {
  include nginx
  nginx::configfile{"conf.d/$name":
    ensure => $ensure,
    template => true,
  }
}
