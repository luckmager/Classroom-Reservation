class UsersController < ApplicationController

  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  private
  # Callback
  def set_user
    @user = User.find(params[:id])
  end

  # Trusted parameters
  def user_params
    params.require(:user).permit(:email, :password, :role, :password_confirmation, :session)
  end
end
