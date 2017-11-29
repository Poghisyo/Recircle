class DashboardsController < ApplicationController
  def show
    @user = current_user
    @purchases = Purchase.visible.where(buyer: current_user)
    @materials = Material.visible.where(seller: current_user)

    @chats = Chat.where(receiver: current_user)
    @sent_chats = Chat.where(sender: current_user)
    @all_chats = @chats + @sent_chats

    @messages = []
    @chats.order(updated_at: :desc).each do |chat|
    @messages += Message.where(chat_id: chat).order(updated_at: :desc)
    end
  end
end
