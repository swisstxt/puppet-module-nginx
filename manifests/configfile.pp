define nginx::configfile(
  $ensure = present,
  $content = undef,
  $source = undef,
  $source_module = $caller_module_name,
) {
  file{"/etc/nginx/${name}":
    ensure  => $ensure,
    owner   => root,
    group   => root,
    mode    => '0644',
    notify  => Exec['reload-nginx'],
    require => Package['nginx'],
  }

  if $ensure != 'absent' {
    if $content {
      File["/etc/nginx/$name"]{
        content => $content,
      }
    } elsif $source {
      File["/etc/nginx/${name}"]{
        source => $source,
      }
    } else {
      File["/etc/nginx/${name}"]{
        source => [
          "puppet:///modules/${source_module}/${name}",
          "puppet:///modules/nginx/${name}",
        ],
      }
    }
  }
}
