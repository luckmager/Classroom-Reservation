module Overrides
  class TokenValidationsController < DeviseTokenAuth::TokenValidationsController

    def validate_token
      # @resource will have been set by set_user_by_token concern
      if @resource
        render json: {
            success: true,
            status: 200
        }
      else
        render json: {
            success: false,
            errors: ["Invalid login credentials"],
            status: 401
        }
      end
    end
  end
end