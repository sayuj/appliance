require 'spec_helper'

describe AppliancesController, :type => :controller do

  let(:appliance) { create(:appliance) }
  let(:target) { create(:target, appliance: appliance) }
  let(:unreachable_target) { create(:target, reachable: false, appliance: appliance) }

  before do
    expect(appliance).to be_valid
    expect(target).to be_valid
    expect(unreachable_target).to be_valid
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end

    it 'assigns @appliances with all appliances records' do
      get 'index'
      expect(assigns(:appliances)).to eq([appliance])
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', id: appliance.id
      expect(response).to be_success
    end

    it 'assigns @target with all targets under the given appliance' do
      get 'show', id: appliance.id
      expect(assigns(:targets)).to eq([target, unreachable_target])
    end

    it 'assigns @status with reachable status of targets under the given appliance' do
      get 'show', id: appliance.id
      expect(assigns(:status)).to eq({reachable_targets: 1, unreachable_targets: 1})
    end
  end
end
