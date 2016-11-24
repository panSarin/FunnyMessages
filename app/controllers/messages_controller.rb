class MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    message.content_with_dialect = set_dialected_content(message_params)
    message.username = session['user']['name']
    if message.create
      # broadcast messages
    end
  end

private

  def set_dialected_content(message_params)
    begin
      content_with_dialect = ConvertByDialect.new(message_params).process
    rescue ConvertByDialect::Process::UnexpectedDialect
      content_with_dialect = message.content
    end
    content_with_dialect
  end

  def message_params
    params.require(:message).permit(:content, :dialect)
  end
end
