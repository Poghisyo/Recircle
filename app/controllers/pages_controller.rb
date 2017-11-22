class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @last_material = Material.last
    @random_material = Material.order("RANDOM()").first
  end
end

