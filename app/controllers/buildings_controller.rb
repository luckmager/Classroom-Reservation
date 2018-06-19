class BuildingsController < ApplicationController
  before_action :set_building, only: :show

  # GET /buildings
  def index
    @buildings = Building.all
  end

  # GET /buildings/index
  def show
  end

  private
  # Callbacks
  def set_building
    @building = Building.find(params[:id])
  end
end
