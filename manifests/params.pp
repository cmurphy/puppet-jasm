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
