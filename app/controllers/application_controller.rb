class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_current_user

  def set_current_user
    @current_user = authenticate
  end

  def current_user
    @current_user
  end

  def authenticate
    authenticate_with_http_token do |token, options|
      User.find_by(auth_token: token)
    end
  end

end
