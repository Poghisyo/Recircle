class ChatsController < ApplicationController
  def index
  end

  def show
  end

  def create
    chat = Chat.where(chat_params)
    chat = chat.last


    byebug
    unless chat
      chat = Chat.new
      chat.sender_id = chat_params[:sender_id]
      chat.receiver_id = chat_params[:receiver_id]
      chat.save
    end
    redirect_to 'show'
  end

  def destroy
  end

  private

  def chat_params
    params.require(:chat).permit(:sender_id, :receiver_id)
  end
end
