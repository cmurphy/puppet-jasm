# == Class: jasm::params
#
# The jasm::params class provides smart defaults for the ssh service name
# for Debian and Redhat.

class jasm::params {
  case $::osfamily {
    'Debian': {
      $ssh_svc = 'ssh'
    }
    'RedHat': {
      $ssh_svc = 'sshd'
    }
    default: {
      fail("${::osfamily} is not supported.")
    }
  }
}
