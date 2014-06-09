# Basic rspec-puppet test file
require 'spec_helper' # lives in spec/spec_helper.rb
describe 'jasm' do

  describe "on osfamily RedHat" do
    let(:facts) {{ :osfamily => 'RedHat' }}

    context 'with defaults for all parameters' do
      it { should contain_class('jasm') }
      it { should contain_file('/etc/ssh/sshd_config') }
      it { should contain_package('openssh-server') }
      it { should contain_service('sshd') }
    end
  end

  describe "on osfamily Debian" do
    let(:facts) {{ :osfamily => 'Debian' }}

    context 'with defaults for all parameters' do
      it { should contain_class('jasm') }
      it { should contain_file('/etc/ssh/sshd_config') }
      it { should contain_package('openssh-server') }
      it { should contain_service('ssh') }
    end
  end
end
