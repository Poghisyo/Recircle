class DashboardsController < ApplicationController
  def show
    @user = current_user
    @purchases = Purchase.where(buyer: current_user)
  end
end
