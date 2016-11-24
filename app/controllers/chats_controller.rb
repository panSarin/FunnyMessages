class ChatsController < ApplicationController
  def show
    @message = Message.new
  end
end
