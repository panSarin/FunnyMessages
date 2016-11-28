class AuthenticationController < ApplicationController
  helper_method :current_user

  before_filter :check_user

  def check_user
    if current_user.nil?
      redirect_to new_users_path
    end
  end

  def current_user
    @current_user ||= UserSession.find.user
  end
end
