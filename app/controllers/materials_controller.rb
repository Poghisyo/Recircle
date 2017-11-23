class MaterialsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  @filters = params.permit(:active)
    if @filters['active'].present? && @filters['active'] == "address"
      @materials = Material.order(:address)
    elsif @filters['active'].present? && @filters['active'] == "price"
      @materials = Material.order(:price)
    elsif @filters['active'].present? && @filters['active'] == "category"
      @materials = Material.order(:category)
    else
      @materials = Material.all
    end

    @hash = Gmaps4rails.build_markers(@materials) do |material, marker|
      marker.lat material.latitude
      marker.lng material.longitude
    end
  end
end
