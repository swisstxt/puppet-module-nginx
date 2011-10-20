define nginx::vhost::template(
  $ensure = present,
  $source = undef
) {
  include nginx
  notice $source 
  nginx::configfile{"conf.d/$name":
    ensure => $ensure,
    source => $source,
    template => true,
  }
}
