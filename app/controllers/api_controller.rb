class ApiController < ActionController::Base
  # Include DeviseToken
  include DeviseTokenAuth::Concerns::SetUserByToken
end
