class MaterialsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    filters = params.permit(:active)
    @address = params[:address]
    @material = params[:material]
    if !@address.blank? && !@material.blank?
      @materials = Material.where(category: @material.downcase).where.not(latitude: nil, longitude: nil).near(@address, 30, order: false)
    elsif !@address.blank?
      @materials = Material.where.not(latitude: nil, longitude: nil).near(@address, 30, order: false)
    elsif !@material.blank?
      @materials = Material.where(category: @material.downcase)
    else
      @materials = Material.where.not(latitude: nil, longitude: nil)
    end

    # if filters['active'].present? && filters['active'] == "location"
    #   @materials =
    if filters['active'].present? && filters['active'] == "price"
      @materials = @materials.order(:price)
    elsif filters['active'].present? && filters['active'] == "category"
      @materials = @materials.order(:category)
    end

    @markers_map = Gmaps4rails.build_markers(@materials) do |material, marker|
      marker.lat material.latitude
      marker.lng material.longitude
    end
  end

  def show
    @material = Material.find(params[:id])
    @marker_map = Gmaps4rails.build_markers(@material) do |material, marker|
      marker.lat material.latitude
      marker.lng material.longitude
    end
  end
end
