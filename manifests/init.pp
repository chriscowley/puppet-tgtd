# == Class: tgtd
#
# Full description of class tgtd here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { tgtd:
#    
#  }
#
# === Authors
#
# Author Name <chris@chriscowley.me.uk>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
class tgtd {
  include tgtd::install 
  include tgtd::config 

}

class tgtd::install {
  package {'scsi-target-utils':
    ensure => installed,
  }
}

class tgtd::config {
    file {'/etc/sysconfig/target':
    content => 'puppet:///modules/tgtd/sysconfig-tgtd',
    require => Class['tgtd::install']
  }
  file {'/etc/tgt/targets.conf':
    content => 'puppet:///modules/tgtd/targets.conf',
    require =>  Class['tgtd::install'],
  }
  file { '/etc/tgt/targets.d':
    ensure  => directory,
    require => Class['tgtd::install']
  }
}
