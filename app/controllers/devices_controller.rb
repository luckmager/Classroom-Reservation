class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  # GET /devices
  def index
    @devices = Device.all
  end

  # GET /devices/index
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/index/edit
  def edit
  end

  # POST /devices
  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/index
  def update
    respond_to do |format|
      if @device.auth == params[:auth]
        if @device.update(device_params)
          format.html { redirect_to admin_devices_path, notice: 'Device was successfully updated.' }
        else
          format.html { render :admin, :edit }
        end
      else
        format.html { redirect_to classrooms_path, notice: 'Unauthorized.' }
      end
    end
  end

  # DELETE /devices/index
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url, notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Callbacks
    def set_device
      @device = Device.find(params[:id])
    end

    # Trusted parameters
    def device_params
      params.require(:device).permit(:name, :auth, :temperature, :humidity, :classroom_id)
    end
end
