# == Class: jasm
#
# The jasm class, for the moment, very light-handedly configures an SSH
# server on Debian-family systems.
#
# === Parameters
#
# This class does not accept parameters yet.
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Examples
#
#  include jasm
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
