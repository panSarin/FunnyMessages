class UsersController < ApplicationController
  def new
    @user_form = UserForm.new
  end

  def create
    if @user_form = UserForm.new(params[:user])
      if @user_form.valid?
        session['user'] = {}
        session['user']['name'] = @user_form.name
        session['user']['dialect'] = @user_form.dialect
        redirect_to chat_path
      else
        render :new
      end
    end
  end
end
