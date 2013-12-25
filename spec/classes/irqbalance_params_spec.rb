require 'spec_helper'

describe 'irqbalance::params', :type => :class do

  context 'for osfamily RedHat' do
    let(:facts) {{ :osfamily => 'RedHat' }}

    it { should contain_class('irqbalance::params') }
  end

  context 'for osfamily Debian' do
    let(:facts) {{ :osfamily => 'Debian' }}

    it { should contain_class('irqbalance::params') }
  end

  context 'unsupported osfamily Solaris' do
    let(:facts) {{ :osfamily => 'Solaris', :operatingsystem => 'Solaris' }}
  
    it 'should fail' do
      expect { should contain_class('irqbalance::params') }.
        to raise_error(Puppet::Error, /not supported on Solaris/)
    end
  end

end
