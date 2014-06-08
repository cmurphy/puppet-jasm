require 'spec_helper_acceptance'

case fact('osfamily')
when 'Debian'
  servicename = 'ssh'
when 'Redhat'
  servicename = 'sshd'
end

describe 'jasm class' do

  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = " class { 'jasm': } "

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_failures => true)
    end

    describe package('openssh-server') do
      it { should be_installed }
    end

    describe service(servicename) do
      it { should be_running }
    end
  end
end
