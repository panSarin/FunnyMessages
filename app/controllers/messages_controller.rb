class MessagesController < AuthenticationController
  def create
    message = Message.new(message_params)
    message.username = current_user.name
    message.dialect = current_user.dialect
    message.content_with_dialect = set_dialected_content(message)
    if message.save
      ActionCable.server.broadcast 'messages', message_html: MessagePresenter.new(message).in_chat
      head :ok
    end
  end

private

  def set_dialected_content(message)
    begin
      converted_content = ConvertByDialect.new(message.content, message.dialect).process
    rescue ConvertByDialect::Process::UnexpectedDialect
      converted_content = message.content #maybe we should render some error/notification ?
    end
    converted_content
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
