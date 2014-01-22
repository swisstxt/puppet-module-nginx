define nginx::vhost (
  $ensure  = present,
  $content = undef,
  $source  = undef,
) {
  include ::nginx
  nginx::configfile{"conf.d/$name":
    ensure        => $ensure,
    content       => $content,
    source        => $source,
    source_module => $caller_module_name,
  }
}
