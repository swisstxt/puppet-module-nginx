define nginx::configfile(
  $ensure = present,
  $content = undef,
  $source = undef,
) {
  file{"/etc/nginx/${name}":
    ensure  => $ensure,
    notify  => Service['nginx'],
    require => Package['nginx'],
  }

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
        "puppet:///modules/${::caller_module_name}/${name}",
        "puppet:///modules/nginx/${name}",
      ],
    }
  }
}
