require 'spec_helper'

describe 'irqbalance', :type => :class do

  describe 'for osfamily RedHat' do
    let(:facts) {{ :osfamily       => 'RedHat' }}

    describe 'one processor' do
      before { facts[:processorcount] = '1' }

      it { should include_class('irqbalance') }
      it { should contain_class('irqbalance::params') }
      it { should contain_class('irqbalance::install').with_ensure('present') }
      it { should contain_class('irqbalance::service').with_ensure('stopped') }

      describe 'ensure => present' do
        let(:params) {{ :ensure => 'present' }}

        it { should contain_class('irqbalance').with_ensure('present') }
        it { should contain_class('irqbalance::params') }
        it { should contain_class('irqbalance::install').with_ensure('present') }
        it { should contain_class('irqbalance::service').with_ensure('stopped') }
      end

      describe 'ensure => latest' do
        let(:params) {{ :ensure => 'latest' }}

        it { should contain_class('irqbalance').with_ensure('latest') }
        it { should contain_class('irqbalance::params') }
        it { should contain_class('irqbalance::install').with_ensure('latest') }
        it { should contain_class('irqbalance::service').with_ensure('stopped') }
      end

      describe 'ensure => absent' do
        let(:params) {{ :ensure => 'absent' }}

        it { should contain_class('irqbalance').with_ensure('absent') }
        it { should contain_class('irqbalance::params') }
        it { should contain_class('irqbalance::install').with_ensure('absent') }
        it { should contain_class('irqbalance::service').with_ensure('stopped') }
      end
    end

    describe 'multiple processors' do
      before { facts[:processorcount] = '2' }

      it { should include_class('irqbalance') }
      it { should contain_class('irqbalance::params') }
      it { should contain_class('irqbalance::install').with_ensure('present') }

      it { should contain_class('irqbalance::service').with_ensure('running') }

      describe 'ensure => present' do
        let(:params) {{ :ensure => 'present' }}

        it { should contain_class('irqbalance').with_ensure('present') }
        it { should contain_class('irqbalance::params') }
        it { should contain_class('irqbalance::install').with_ensure('present') }
        it { should contain_class('irqbalance::service').with_ensure('running') }
      end

      describe 'ensure => latest' do
        let(:params) {{ :ensure => 'latest' }}

        it { should contain_class('irqbalance').with_ensure('latest') }
        it { should contain_class('irqbalance::params') }
        it { should contain_class('irqbalance::install').with_ensure('latest') }
        it { should contain_class('irqbalance::service').with_ensure('running') }
      end

      describe 'ensure => absent' do
        let(:params) {{ :ensure => 'absent' }}

        it { should contain_class('irqbalance').with_ensure('absent') }
        it { should contain_class('irqbalance::params') }
        it { should contain_class('irqbalance::install').with_ensure('absent') }
        it { should contain_class('irqbalance::service').with_ensure('stopped') }
      end
    end

    describe 'ensure => foo' do
      let(:params) {{ :ensure => 'foo' }}
  
      it 'should fail' do
      expect { should contain_class('irqbalance') }.
        to raise_error(Puppet::Error)
      end
    end
  end

end
