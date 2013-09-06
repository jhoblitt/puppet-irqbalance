require 'spec_helper'

describe 'irqbalance::service', :type => :class do
  let :pre_condition do
    'include irqbalance::params'
  end

  describe 'for osfamily RedHat' do
    let(:facts) {{ :osfamily => 'RedHat' }}

    it { should include_class('irqbalance::service') }
    it do
      should contain_service('irqbalance').with({
        :ensure => 'running',
        :enable => 'true',
      })
    end

    describe 'ensure => running' do
      let(:params) {{ :ensure => 'running' }}
  
      it { should contain_class('irqbalance::service').with_ensure('running') }
      it do
        should contain_service('irqbalance').with({
          :ensure => 'running',
          :enable => 'true',
        })
      end
    end

    describe 'ensure => stopped' do
      let(:params) {{ :ensure => 'stopped' }}
  
      it { should contain_class('irqbalance::service').with_ensure('stopped') }
      it do
        should contain_service('irqbalance').with({
          :ensure => 'stopped',
          :enable => 'false',
        })
      end
    end

    describe 'ensure => foo' do
      let(:params) {{ :ensure => 'foo' }}
  
      it 'should fail' do
      expect { should contain_class('irqbalance::service') }.
        to raise_error(Puppet::Error)
      end
    end
  end

end
