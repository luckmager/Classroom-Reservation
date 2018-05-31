module Overrides
  class SessionsController < DeviseTokenAuth::SessionsController

    def resource_data(opts = {})
      opts[:resource_json] || @resource.as_json
    end

    def render_new_error
      render json: {
          errors: [I18n.t("devise_token_auth.sessions.not_supported")]
      }, status: 405
    end

    def render_create_success
      render json: {
          login: @resource.as_json
      }
    end

    def render_create_error_not_confirmed
      render json: {
          errors: [I18n.t("devise_token_auth.sessions.not_confirmed", email: @resource.email)]
      }, status: 404
    end

    def render_create_error_bad_credentials
      render json: {
          errors: [I18n.t("devise_token_auth.sessions.bad_credentials")]
      }, status: 402
    end

    def render_destroy_success
      render json: {
      }, status: 200
    end

    def render_destroy_error
      render json: {
          errors: [I18n.t("devise_token_auth.sessions.user_not_found")]
      }, status: 404
    end
  end
end