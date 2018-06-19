class ApplicationController < ActionController::Base
  # Cross-site scripting protection
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
end
