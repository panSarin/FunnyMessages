class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.reset_persistence_token!
      UserSession.create(@user, true)
      ActionCable.server.broadcast 'users', name: @user.name
      redirect_to chat_path
    else
      render :new
    end
  end

  # TODO - add sign out feature, and handle removing old users / heartbeating frontend that will let us know
  # who logged out

private

  def user_params
    params.require(:user).permit(:name, :dialect)
  end

end
