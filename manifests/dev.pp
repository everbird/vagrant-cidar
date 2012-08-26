Exec {
  path => '/usr/bin:/bin:/usr/sbin:/sbin',
  logoutput => on_failure,
}

notify { "Hello World":
  name => "This will not be shown or logged.",
  message => "Hello, World!"
}

include vagrant

class { local_repo:
  source => 'default'
}

include infrastructure
