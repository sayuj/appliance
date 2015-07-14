class TargetsController < ApplicationController
  before_action :set_target, only: [:show]

  def index
    @targets = Target.all
    @status = Target.reachable_status
  end

  def show
  end


  private

  def set_target
    @target = Target.find(params[:id])
  end
end
