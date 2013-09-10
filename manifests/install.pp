class tgtd::install {
  package { "scsi-target-utils":
    ensure => installed,
  }
}
