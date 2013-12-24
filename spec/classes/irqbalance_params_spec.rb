require 'spec_helper'

describe 'irqbalance::params', :type => :class do

  describe 'for osfamily RedHat' do
    let(:facts) {{ :osfamily => 'RedHat' }}

    it { should contain_class('irqbalance::params') }
  end

  describe 'unsupported osfamily' do
    let :facts do 
      {
        :osfamily        => 'Debian',
        :operatingsystem => 'Debian',
      }
    end
  
    it 'should fail' do
      expect { should contain_class('irqbalance::params') }.
        to raise_error(Puppet::Error, /not supported on Debian/)
    end
  end

end
