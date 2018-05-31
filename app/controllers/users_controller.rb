class UsersController < ApplicationController
  # POST /users
  # POST /users.json
  protect_from_forgery with: :exception
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_building
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def building_params
    params.require(:user).permit(:email, :password, :password_confirmation, :session)
  end
end
