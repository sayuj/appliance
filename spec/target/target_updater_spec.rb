require 'spec_helper'

describe TargetUpdater do
  let(:appliance) { Appliance.create! name: 'app1', customer: 'WhiteHat1' }
  let(:target) { Target.create! hostname: 'host1', address: '8.8.8.8', appliance: appliance }

  describe '#update_reachability' do
    it 'updates reachablity of each targets' do
    end
  end
end
