class nginx::spawn-fcgi {
  package { 'spawn-fcgi':
    ensure => present,
  } ->
  file { '/etc/sysconfig/spawn-fcgi':
    source => [
      "puppet:///modules/${::caller_module_name}/spawn-fcgi.sysconfig",
      "puppet:///modules/nginx/spawn-fcgi.sysconfig",
    ],
    owner  => root,
    group  => root,
    mode   => 0444,
  } ~>
  service { 'spawn-fcgi':
    ensure    => running,
    enable    => true,
    hasstatus => true,
  }
}
