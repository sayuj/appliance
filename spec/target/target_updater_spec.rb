require 'spec_helper'

describe TargetUpdater do
  describe '#update_reachability' do
    let(:target1) { create(:target) }
    let(:target2) { create(:target) }

    before do
      allow(Target).to receive(:all) { [target1, target2] }
    end

    it 'updates reachablity of each targets' do
      expect(target1).to receive(:update_reachability!)
      expect(target2).to receive(:update_reachability!)

      subject.update_reachability
    end
  end
end
