class ApplicationController < ActionController::Base
  # Adds a few additional behaviors into the application controller
  include Blacklight::Controller
  layout 'blacklight'

# Alias new_session_path as login_path for default devise config
def new_session_path(scope)
  login_path
end

def new_user_session_path(scope)
  login_path
end

def after_sign_in_path_for(resource)
  request.env['omniauth.origin'] || stored_location_for(resource) || root_path
end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
