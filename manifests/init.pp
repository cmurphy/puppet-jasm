# == Class: jasm
#
# This version of the jasm class uses augeas with the default provider
# to configure the sshd_config file.
#
# === Examples
#
#  class { 'jasm':
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
class jasm(
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

  augeas { 'sshd_config_permit_root_login':
    context => '/files/etc/ssh/sshd_config',
    changes => [
      "set PermitRootLogin $permit_root_login",
    ],
    require => File['/etc/ssh/sshd_config'],

  }

  service { $jasm::params::ssh_svc:
    ensure    => running,
    subscribe => File['/etc/ssh/sshd_config'],
  }

}
