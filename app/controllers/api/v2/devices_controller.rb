class Api::V2::DevicesController < ApplicationController
  before_action :set_device

  # PUT /api/v2/devices/index
  def update
    if @device.auth == params[:auth]
        if @device.update(device_params)
          render json: {
              success: true
          }, status: 200
        else
          render json: {
              success: false,
              errors: @device.errors
          }, status: :unprocessable_entity
        end
    else
      render json: {
          success: false,
          errors: ["Unauthorized"]
      }, status: 401
    end
  end

  private
  # Callbacks
  def set_device
    @device = Device.find(params[:id])
  end

  # Trusted parameters
  def device_params
    params.require(:device).permit(:auth, :temperature, :humidity)
  end
end
