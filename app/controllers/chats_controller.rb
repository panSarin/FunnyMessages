class ChatsController < AuthenticationController
  def show
    @message = Message.new
  end
end
