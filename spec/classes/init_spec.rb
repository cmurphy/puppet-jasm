require 'spec_helper'
describe 'jasm' do

  context 'with defaults for all parameters' do
    it { should contain_class('jasm') }
    it { should contain_file('/etc/ssh/sshd_config') }
  end
end
