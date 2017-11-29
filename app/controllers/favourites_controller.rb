class FavouritesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @fav = Favourite.new
    @fav.material_id = params[:material_id]
    @fav.user_id = current_user.id
    @fav.save!
    @material = Material.find(params[:material_id])
    redirect_to(:back)
    flash[:notice] = "#{@material.title} has been added to your wishlist"

  end
end
