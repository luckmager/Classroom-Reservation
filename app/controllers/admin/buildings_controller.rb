class Admin::BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit, :update, :destroy]

  # GET /admin/buildings
  def index
    @buildings = Building.all
  end

  # GET /admin/buildings/index
  def show
  end

  # GET /admin/buildings/new
  def new
    @building = Building.new
  end

  # GET /admin/buildings/index/edit
  def edit
  end

  # POST /admin/buildings
  def create
    @building = Building.new(building_params)

    respond_to do |format|
      if @building.save
        format.html { redirect_to admin_buildings_path, notice: 'Building was successfully created.' }
      else
        format.html { render new_admin_building_path }
      end
    end
  end

  # PUT /admin/buildings/index
  def update
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to admin_buildings_path, notice: 'Building was successfully updated.' }
      else
        format.html { render new_admin_building_path }
      end
    end
  end

  # DELETE /admin/buildings/index
  def destroy
    @building.destroy
    respond_to do |format|
      format.html { redirect_to admin_buildings_path, notice: 'Building was successfully deleted.' }
    end
  end

  private
  # Callbacks
  def set_building
    @building = Building.find(params[:id])
  end

  # Trusted parameters
  def building_params
    params.require(:building).permit(:name)
  end
end