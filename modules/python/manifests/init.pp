class python {
  package {[
    'dev-python/virtualenv',
    'dev-python/pip',
    'dev-python/ipython',
    ]:
      ensure => latest
  }
  package_keywords { 'dev-python/virtualenvwrapper':
    keywords    => ['~x86'],
    target      => 'puppet',
  }

  package { 'dev-python/virtualenvwrapper':
    ensure => latest
  }
}
