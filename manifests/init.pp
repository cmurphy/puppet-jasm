# == Class: jasm
#
# This version of the jasm class uses an options hash and an array of ports
# so that the user can add their own configs to the sshd_config file and use
# multiple ports to configure the sshd_config file.
#
# === Examples
#
#  class { 'jasm':
#    ports             => [ 22, 80 ]
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
  $ports   = [ 22 ],
  $options = {}
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
