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

  # puppet-gentoo would create puppet file with mode 600, which cause eix faild when provision
  file { '/etc/portage/package.keywords/puppet':
    mode => 644,
  }

  package { 'dev-python/virtualenvwrapper':
    ensure => latest
  }
}
