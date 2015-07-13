class AppliancesController < ApplicationController
  before_action :set_appliance, only: [:show]

  def index
    @appliances = Appliance.all
  end

  def show
    @targets = @appliance.targets
    @status = @targets.reachable_status
  end


  private

  def set_appliance
    @appliance = Appliance.find(params[:id])
  end
end
