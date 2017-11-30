class DashboardsController < ApplicationController
  def show
    @user = current_user
    @purchases = Purchase.visible.where(buyer: current_user)
    @materials = Material.visible.where(seller: current_user)
    @material = Material.new

    @chats = Chat.where(receiver: current_user).order(updated_at: :desc)
    @sent_chats = Chat.where(sender: current_user).order(updated_at: :desc)
    @all_chats = @chats + @sent_chats

    @messages = []
    @all_chats.each do |chat|
      @messages += Message.where(chat_id: chat).order(updated_at: :desc)
    end

    @favourites = Favourite.where(user_id: current_user)
  end
end
