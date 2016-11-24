class AuthenticationController < ApplicationController
  before_filter :check_user

  def check_user
    if session['user'].nil?
      redirect_to new_user_path
    end
  end
end
