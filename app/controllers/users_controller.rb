class UsersController < ApplicationController
  def new
    @user_form = UserForm.new
  end

  def create
    if @user_form = UserForm.new(params[:user])
      if @user_form.valid?
        set_user_in_session
        ActionCable.server.broadcast 'users',
                                     name: @user_form.name
        redirect_to chat_path
      else
        render :new
      end
    end
  end

private
  def set_user_in_session
    session['user'] = {}
    session['user']['name'] = @user_form.name
    session['user']['dialect'] = @user_form.dialect
  end
end
