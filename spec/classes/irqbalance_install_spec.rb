require 'spec_helper'

describe 'irqbalance::install', :type => :class do
  let :pre_condition do
    'include irqbalance::params'
  end

  describe 'for osfamily RedHat' do
    let(:facts) {{ :osfamily => 'RedHat' }}

    it { should include_class('irqbalance::install') }
    it { should contain_package('irqbalance').with_ensure('present') }

    describe 'ensure => present' do
      let(:params) {{ :ensure => 'present' }}
  
      it { should include_class('irqbalance::install') }
      it { should contain_package('irqbalance').with_ensure('present') }
    end

    describe 'ensure => latest' do
      let(:params) {{ :ensure => 'latest' }}
  
      it { should include_class('irqbalance::install') }
      it { should contain_package('irqbalance').with_ensure('latest') }
    end

    describe 'ensure => absent' do
      let(:params) {{ :ensure => 'absent' }}
  
      it { should include_class('irqbalance::install') }
      it { should contain_package('irqbalance').with_ensure('absent') }
    end

    describe 'ensure => foo' do
      let(:params) {{ :ensure => 'foo' }}
  
      it 'should fail' do
        expect { should include_class('irqbalance::install') }.
          to raise_error(Puppet::Error)
      end
    end
  end

end
