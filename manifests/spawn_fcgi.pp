class nginx::spawn_fcgi(
  $children = 1,
) {
  include ::nginx

  package { 'spawn-fcgi':
    ensure => present,
  } ->
  file { '/etc/sysconfig/spawn-fcgi':
    content => template('nginx/spawn-fcgi.sysconfig.erb'),
    owner   => root,
    group   => root,
    mode    => '0444',
  } ~>
  service { 'spawn-fcgi':
    ensure    => running,
    enable    => true,
    hasstatus => true,
  }
}
