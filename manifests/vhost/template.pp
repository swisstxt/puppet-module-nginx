define nginx::vhost::template(
  $ensure = present,
  $source = undef
) {
  include nginx
  nginx::configfile{"conf.d/$name":
    ensure => $ensure,
    source => $source,
    template => true,
  }
}
