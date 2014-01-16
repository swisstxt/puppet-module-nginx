define nginx::vhost::file(
  $ensure  = present,
  $content = undef,
  $source  = undef,
) {
  include ::nginx
  nginx::configfile{"conf.d/$name":
    ensure  => $ensure,
    content => $content,
    source  => $source,
  }
}
