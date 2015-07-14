require 'spec_helper'

describe TargetsController, :type => :controller do

  let(:appliance) { create(:appliance) }
  let(:target) { create(:target) }

  before do
    expect(appliance).to be_valid
    expect(target).to be_valid
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end

    it 'assigns @targets with all targets records' do
      get 'index'
      expect(assigns(:targets)).to eq([target])
    end

    it 'assigns @status with reachable status of targets' do
      get 'index'
      expect(assigns(:status)).to eq({reachable_targets: 1, unreachable_targets: 0})
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', appliance_id: appliance.id, id: target.id
      expect(response).to be_success
    end

    it 'assigns @target' do
      get 'show', appliance_id: appliance.id, id: target.id
      expect(assigns(:target)).to eq(target)
    end
  end
end
