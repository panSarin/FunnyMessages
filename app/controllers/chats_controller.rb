class ChatsController < AuthenticationController
  def show
    @users = User.where("last_request_at > ?", Time.current - 5.minutes)
    @message = Message.new
  end
end
