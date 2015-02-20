class local_repo($source = 'default') {
  $repo_conf = ""

  exec { 'sync-gentoo-portages':
    #command => 'emerge --sync',
    command => 'emerge-webrsync',
    timeout => 600,
  }
  Exec['sync-gentoo-portages'] -> Package <| |>

  package { 'sys-apps/portage': ensure => latest }
  package { 'app-portage/eix': ensure => latest }
  Package['sys-apps/portage'] -> Package['app-portage/eix']

  exec { 'eix-sync':
    command => 'eix-sync',
    timeout => 600,
  }
  Package['app-portage/eix'] -> Exec['eix-sync']

  package { 'app-portage/layman': ensure => latest }

}
