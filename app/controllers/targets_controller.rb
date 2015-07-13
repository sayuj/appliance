class TargetsController < ApplicationController
  before_action :set_target, only: [:show]

  def index
    @targets = Target.all
  end

  def show
  end

  def set_target
    @target = Target.find(params[:id])
  end
end
