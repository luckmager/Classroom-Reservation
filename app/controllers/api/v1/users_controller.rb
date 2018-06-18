class Api::V1::UsersController < ApiController
  before_filter :authenticate_user!, only: [:current]

  def current
    @user = current_user
    puts "errors are: #{@user.errors.to_hash}"
    puts "current user is: #{@user}"
    if @user
      render json: @user, status: 200
    else
      render json: {errors: 'bad request or current user not found'}, status: 400
    end
  end

  def index
    @users = User.all

    render "/api/v1/users/index.json"
  end
end