class MaterialsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    set_filters
    set_map
end

def show
  @chat = Chat.new
  @material = Material.find(params[:id])
  @markers_map = Gmaps4rails.build_markers(@material) do |material, marker|
    marker.lat material.latitude
    marker.lng material.longitude
  end
  @purchase = Purchase.new
end

def new
  @material = Material.new
end

def create
  @material = Material.new(materials_params)
  @material.status = 'For Sale'
  @material.seller = current_user
  @material.save!
  redirect_to dashboard_path(active: 'materials')
end

def destroy
    @material=Material.find(params[:id])
    # @material.destroy
    @material.update(hidden: true)

    flash.notice="Material '#{@material.title}' was deleted"

    redirect_to dashboard_path(active: 'materials')
end

private

def set_map
      @markers_map = Gmaps4rails.build_markers(@materials) do |material, marker|
      marker.title material.title
      marker.lat material.latitude
      marker.lng material.longitude
      marker.infowindow "
                        <a href='#{material_path(material)}'>
                        <h4 class='text-center'>#{ material.title}</h4>
                        </a>
                         <p class='text-center'>#{ material.address}</p>"
      marker.picture({
      url: "https://41.media.tumblr.com/028c5097d2e537595c86a81934b83cbf/tumblr_o4u8o54tpv1qjknfdo1_75sq.png", # up to you to pass the proper parameters in the url, I guess with a method from device
      width: 36,
      height: 36
      })
    end
  end

def set_filters
  filters = params.permit(:active)
  @address = params[:address]
  @material = params[:material]
  if !@address.blank? && !@material.blank?
    @materials = Material.where(category: @material.downcase).where.not(latitude: nil, longitude: nil).near(@address, 20, order: true)
  elsif !@address.blank?
    @materials = Material.where.not(latitude: nil, longitude: nil).near(@address, 20, order: false)
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
  end

  def materials_params
    params.require(:material).permit(:user_id, :title, :category, :status, :address, :condition, :photo, :source, :supplier, :price, :quantity, :lead_time, :description)
  end
end
