class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/index
  def show
  end

  # GET /users/new
  def new
    @user= User.new
  end

  # GET /users/index/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
      else
        format.html { render new_admin_user_path }
      end
    end
  end

  # PATCH/PUT /user/index
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
      else
        format.html { render new_admin_user_path }
      end
    end
  end

  # DELETE /users/index
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User was successfully destroyed.' }
    end
  end

  private
  # Callbacks
  def set_user
    @user = User.find(params[:id])
  end

  # Trusted params
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :role, :password)
  end
end