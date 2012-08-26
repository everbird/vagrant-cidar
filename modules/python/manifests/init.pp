class python {
  package {[
    'dev-python/virtualenv',
    'dev-python/pip',
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
