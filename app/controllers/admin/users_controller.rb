class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /admin/users
  def index
    @users = User.all
  end

  # GET /admin/users/index
  def show
  end

  # GET /admin/users/new
  def new
    @user= User.new
  end

  # GET /admin/users/index/edit
  def edit
  end

  # POST /admin/users
  def create
    @user = User.new(user_params)
    @user.password = "Test1324"
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
      else
        format.html { render new_admin_user_path }
      end
    end
  end

  # PUT /admin/user/index
  def update
    @user.role = 1
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
      else
        format.html { render new_admin_user_path }
      end
    end
  end

  # DELETE /admin/users/index
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User was successfully deleted.' }
    end
  end

  private
  # Callbacks
  def set_user
    @user = User.find(params[:id])
  end

  # Trusted params
  def user_params
    params.require(:user).permit(:email, :role)
  end
end