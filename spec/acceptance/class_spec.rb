# Basic beaker-rspec test file
require 'spec_helper_acceptance'  # lives in spec/spec_helper_acceptance.rb

# Define variables based on facts
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

    # Check that the package was installed
    describe package('openssh-server') do
      it { should be_installed }
    end

    # Check that the correct service is running
    describe service(servicename) do
      it { should be_running }
    end
  end
end
