/*
 * https://github.com/example42/puppet-modules/blob/master/timezone/manifests/init.pp
 * https://github.com/uggedal/puppet-module-timezone
 */

class timezone($zone="UTC") {

  file { "timezone":
    ensure  => present,
    path    => "/etc/timezone",
    content => inline_template('<%= zone + "\n" %>'),
  }

  exec { "set-timezone":
    command     => "cp /usr/share/zoneinfo/${zone} /etc/localtime",
    require     => File["timezone"],
    subscribe   => File["timezone"],
    refreshonly => true,
  }
}
