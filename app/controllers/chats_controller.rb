class ChatsController < ApplicationController
  def index
    @messages = Message.where(user: current_user)
    redirect_to dashboard_path(active: 'messages')
  end

  def show
    @chat = Chat.find(params[:id])
    @messages = Message.where(chat_id: @chat)
  end

  def create
    chat = Chat.where(chat_params)
    @chat = chat.last
    unless @chat
      @chat = Chat.new
      @chat.sender_id = current_user.id
      @chat.receiver_id = chat_params[:receiver_id]
      @chat.save
    end
    # @chat = chat
    @message = Message.new
    redirect_to new_dashboard_chat_message_path(@chat, @message)
  end

  def update
    @chat = Chat.find(params[:chat_id])
    # @chat = chat.last
    @message = Message.new
    redirect_to new_dashboard_chat_message_path(@chat, @message)
  end

  def destroy
  end

  private

  def chat_params
    params.require(:chat).permit(:sender_id, :receiver_id, :chat_id)
  end
end
