define nginx::configfile(
  $ensure = present,
  $source = undef,
  $template = false
) {
  if $source {
    $real_source = $source
  } else {
    $real_source = $name
  }
  file{"/etc/nginx/$name":
    ensure => $ensure,
    notify => Service['nginx'],
    require => Package['nginx'],
    owner => root, group => root, mode => 0644;
  }
  if $template {
    File["/etc/nginx/$name"]{
      content => template("site-nginx/$real_source.erb"),
    }
  } elsif $source {
    File["/etc/nginx/$name"]{
      source => $source
    }
  } else {
    File["/etc/nginx/$name"]{
      source => [
        "puppet://$server/modules/site-nginx/$fqdn/$real_source",
        "puppet://$server/modules/site-nginx/$real_source",
        "puppet://$server/modules/nginx/$real_source",
      ],
    }
  }
}
