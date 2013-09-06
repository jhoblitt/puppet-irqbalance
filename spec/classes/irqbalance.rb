require 'spec_helper'

describe 'irqbalance', :type => :class do

  describe 'for osfamily RedHat' do
    it { should contain_class('irqbalance') }
  end

end
