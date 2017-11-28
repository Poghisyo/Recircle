class MessagesController < ApplicationController
  def new
    @chat = Chat.find(params[:chat_id])
    @message = Message.new
  end

  def create
    message = Message.new(message_params)
    @chat = Chat.find(params[:chat_id])
    message.chat = @chat
    message.user = current_user
    message.save
    redirect_to dashboard_path(active: 'messages')
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:content, :subject)
  end


end
