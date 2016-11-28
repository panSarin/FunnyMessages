class MessagePresenter
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def in_chat
    "<div class='#{message.dialect}'>
       <div class='avatar'><div class='avatar-img'></div>  <p> #{message.username} </p></div>
      <div class='text'><p> <i>(#{I18n.l(message.created_at)} ): </i> #{ message.content_with_dialect }</p></div>
    </div>"
  end
end
