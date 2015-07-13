require 'spec_helper'

describe TargetUpdater do
  # TODO: Rewrite
  describe '#update_reachability' do
    let(:target) { create(:target) }

    before do
      allow(Target).to receive(:all) { [target] }
    end

    it 'updates reachablity of each targets' do
      expect(target).to receive(:update_reachability!)
      subject.update_reachability
    end
  end
end
