class DashboardsController < ApplicationController
  def show
    @user = current_user
    @purchases = Purchase.where(buyer: current_user)
    @materials = Material.where(seller: current_user)
    @chats = Chat.where(receiver: current_user)
    @sent_chats = Chat.where(sender: current_user)
  end
end
