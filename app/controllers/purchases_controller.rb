class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.where(user: current_user)
  end

  def new

  end

  def create
    purchase = Purchase.new
    purchase.buyer = current_user
    mater = Material.find(params[:material_id])
    purchase.material = mater
    purchase.status = 'pending'
    byebug
    purchase.save!

    redirect_to dashboard_path(active: 'purchases')
  end


  private

  def purchase_params
    params.require(:material_id).permit(:material_id)
  end

end
