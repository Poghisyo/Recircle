class ChatsController < ApplicationController
  def index
  end

  def show
  end

  def create
    chat = Chat.new(chats_params)
  end

  def destroy
  end

  private

  def chats_params
   end
end
