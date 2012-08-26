class vagrant() {
  class { timezone:
    zone => 'PRC',
  }

  file { '/home/vagrant/postinstall.sh':
    ensure => absent,
  }

  file { '/etc/motd':
    ensure => file,
    owner  => root,
    group  => root,
    source => 'puppet:///modules/vagrant/motd',
  }
}
