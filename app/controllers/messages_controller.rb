class MessagesController < ApplicationController
  def create
    message = Message.new(params[:message])
    # convert by dialect
    if message.create
      # broadcast messages
    end
  end
end
