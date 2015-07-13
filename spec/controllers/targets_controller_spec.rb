require 'spec_helper'

describe TargetsController, :type => :controller do

  let(:appliance) { create(:appliance) }
  let(:target) { create(:target) }

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', appliance_id: appliance.id, id: target.id
      expect(response).to be_success
    end
  end
end
