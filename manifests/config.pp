class tgtd::config {
  file { "/etc/sysconfig/tgtd":
    source  => 'puppet:///modules/tgtd/sysconfig-tgtd',
    require => Class['tgtd::install'],
  }
}
