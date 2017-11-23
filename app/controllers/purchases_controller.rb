class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.where(user: current_user)
  end

  def new

  end

  def create
    purchase = Purchase.new
    purchase.buyer = current_user
    purchase.material_id = params[:material_id]
    purchase.status = 'pending'
    purchase.save!

    redirect_to dashboard_path(active: 'purchases')
  end

end
