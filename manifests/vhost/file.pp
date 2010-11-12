define nginx::vhost::file(
  $ensure = present
) {
  include nginx
  file{"/etc/nginx/conf.d/$name":
    ensure => $ensure,
    source => [
      "puppet://$server/modules/site-nginx/$fqdn/conf.d/$name",
      "puppet://$server/modules/site-nginx/conf.d/$name",
      "puppet://$server/modules/nginx/conf.d/$name",
    ],
    require => Package['nginx'],
    notify => Service['nginx'],
    owner => root, group => 0, mode => 0644;
  }
}
