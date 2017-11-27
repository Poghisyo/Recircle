class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @materials = Material.all
    @last_material = Material.last
    @random_material = Material.order("RANDOM()").first
    @three_materials = @materials.take(3)
  end
end
