class infrastructure() {
  include python
  #include mysql
  #include memcache
  #include redis

  package {[
    'app-misc/tmux',
    'sys-process/lsof',
  ]:
    ensure => latest
  }
}
