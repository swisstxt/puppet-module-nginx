define nginx::configfile(
  $ensure = present
) {
  file{"/etc/nginx/$name":
    enure => $ensure,
    source => [
      "puppet://$server/modules/site-nginx/$fqdn/$name",
      "puppet://$server/modules/site-nginx/$name",
      "puppet://$server/modules/nginx/$name",
    ],
    notify => Service['nginx'],
    require => Package['nginx'],
    owner => root, group => root, mode => 0440;
  }
}

