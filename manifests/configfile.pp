define nginx::configfile(
  $ensure = present,
  $template = false
) {
  file{"/etc/nginx/$name":
    ensure => $ensure,
    notify => Service['nginx'],
    require => Package['nginx'],
    owner => root, group => root, mode => 0440;
  }
  if $template {
    File["/etc/nginx/$name"]{
      content => template("site-nginx/$name.erb"),
    }
  } else {
    File["/etc/nginx/$name"]{
      source => [
        "puppet://$server/modules/site-nginx/$fqdn/$name",
        "puppet://$server/modules/site-nginx/$name",
        "puppet://$server/modules/nginx/$name",
      ],
    }
  }
}
