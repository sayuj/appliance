require 'spec_helper'

describe AppliancesController, :type => :controller do

  let(:appliance) { create(:appliance) }

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', id: 1
      expect(response).to be_success
    end
  end

end
