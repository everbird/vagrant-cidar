class infrastructure() {
  include python
  #include mysql
  #include memcache
  #include redis

  package {[
    'app-misc/tmux',
    'sys-process/lsof',
    'dev-util/strace',
    'net-analyzer/ifstat',
    'sys-process/htop',
    'app-admin/sysstat',
  ]:
    ensure => latest
  }
}
