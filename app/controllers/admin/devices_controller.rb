class Admin::DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  before_action :set_classroom, only: [:new, :create, :update]

  # GET /admin/devices
  def index
    @devices = Device.all
  end

  # GET /admin/devices/index
  def show
  end

  # GET /admin/devices/new
  def new
    @device = Device.new
  end

  # GET /admin/devices/index/edit
  def edit
  end

  # POST /admin/devices
  def create
    @device = Device.new(device_params)
    @device.classroom_id = @classroom.id
    respond_to do |format|
      if @device.save
        format.html { redirect_to admin_building_classroom_path(@device.classroom.building, @device.classroom) , notice: 'Device was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PUT /admin/devices/index
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to admin_building_classroom_path(@device.classroom.building, @device.classroom), notice: 'Device was successfully updated.' }
      else
        format.html { render "admin/buildings/#{@classroom.building.id}/classrooms/#{@classroom.id}/devices/#{@device.id}/edit" }
      end
    end
  end

  # DELETE /admin/devices/index
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to admin_building_classroom_path(@device.classroom.building, @device.classroom), notice: 'Device was successfully deleted.' }
    end
  end

  private
    # Callbacks
    def set_device
      @device = Device.find(params[:id])
    end

    def set_classroom
      @classroom = Classroom.find(params[:classroom_id])
    end

    # Trusted parameters
    def device_params
      params.require(:device).permit(:name, :auth)
    end
end
