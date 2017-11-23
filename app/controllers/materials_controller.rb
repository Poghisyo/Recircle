class MaterialsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  @filters = params.permit(:address)
    if @filters.present?
      @materials = Material.where("address ILIKE ?", "%#{@filters['address'].capitalize}%")
    else
      @materials = Material.all
    end

    @hash = Gmaps4rails.build_markers(@materials) do |material, marker|
      marker.lat material.latitude
      marker.lng material.longitude
    end
  end

  def show
    @material = Material.find(params[:id])
    @hash = Gmaps4rails.build_markers(@material) do |material, marker|
      marker.lat material.latitude
      marker.lng material.longitude
    end
  end
end
