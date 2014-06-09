# == Class: jasm
#
# The jasm class, for the moment, very light-handedly configures an SSH
# server.
#
# === Examples
#
#  class { 'jasm':
#    port              => 80,
#    syslog_facility   => 'AUTHPRIV',
#    log_level         => 'DEBUG'
#    permit_root_login => 'without-password',
#  }
#
# === Authors
#
# Colleen Murphy <cmurphy@cat.pdx.edu>
#
# === Copyright
#
# Copyright 2014 Colleen Murphy
#
class jasm (
  $port              = 22,
  $syslog_facility   = 'AUTH',
  $log_level         = 'INFO',
  $permit_root_login = 'no',
){
  include jasm::params

  package { 'openssh-server':
    ensure => installed,
    before => File['/etc/ssh/sshd_config'],
  }

  file { '/etc/ssh/sshd_config':
    ensure  => file,
    content => template('jasm/sshd_config.erb'),
  }

  service { $jasm::params::ssh_svc:
    ensure    => running,
    subscribe => File['/etc/ssh/sshd_config'],
  }

}
