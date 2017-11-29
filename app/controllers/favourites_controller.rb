class FavouritesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @fav = Favourite.new
    @fav.material_id = params[:material_id]
    @fav.user_id = current_user
    @fav.save!
    redirect_to(:back)
  end
end
