class ApiController < ActionController::Base
  before_action :authenticate_user!
  # Include DeviseToken
  include DeviseTokenAuth::Concerns::SetUserByToken
end
