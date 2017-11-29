require "cloudinary"
include CloudinaryHelper

puts 'cleaning database'
Purchase.destroy_all
Material.destroy_all
User.destroy_all


puts 'Creating 86 fake users with material...'
86.times do
  user = User.new({
    email: Faker::Internet.email,
    password: Faker::Vehicle.vin
    })
  user.save!
  category = ["grass", "flower cuttings", "hedge trimmings", "nails", "wiring", "machine parts", "rubble", "glass bottles", "broken glassware", "light bulbs", "leftovers", "organics", "plastic bottles", "rubber", "industrial plastic", "cardboard", "discarded paper", "woodchips", "unrefined wood", "sawdust"].sample

  photos = {
    # "grass" => "https://static.pexels.com/photos/7174/summer-grass.jpg",
    "grass" => cl_image_path("grass_jkmdtq.jpg"),
    "flower cuttings" => cl_image_path("flower_cuttings_kg2cvs.jpg"),
    "hedge trimmings" => cl_image_path("hedge_trimmings_dw9js7.webp"),
    "nails" => cl_image_path("construction_metals_jl0vug.jpg"),
    "wiring" => cl_image_path("wiring_ddyc2g.jpg"),
    "machine parts" => cl_image_path("machine_parts_ujvrla.jpg"),
    "rubble" => cl_image_path("rubble_zuf5rm.jpg"),
    "glass bottles" => cl_image_path("glass_bottles_oew8ia.jpg"),
    "broken glassware" => cl_image_path("broken_glassware_icqiey.jpg"),
    "light bulbs" => cl_image_path("lightbulbs_x0hnu1.jpg"),
    "leftovers" => cl_image_path("leftovers_eixwvx.jpg"),
    "organics" => cl_image_path("organics_eyqvz0.jpg"),
    "plastic bottles" => cl_image_path("plastic_bottle_upv8eo.jpg"),
    "rubber" => cl_image_path("rubber_jc0nky.jpg"),
    "industrial plastic" => cl_image_path("plastics_x653mc.jpg"),
    "cardboard" => cl_image_path("cardboard_l74yjb.jpg"),
    "discarded paper" => cl_image_path("discarded_paper_xdmz9p.jpg"),
    "woodchips" => cl_image_path("woodchips_bc2sjp.jpg"),
    "unrefined wood" => cl_image_path("unrefined_wood_c7ozzv.jpg"),
    "sawdust" => cl_image_path("wood_xx4umq.jpg")
  }
  material = Material.new({
    seller: user,
    # category: Faker::Commerce.material,
    category: category,
    remote_photo_url: photos[category],
    title: Faker::Commerce.product_name,
    price: Faker::Number.between(20, 3000),
    supplier: Faker::Company.name,
    created_at: Faker::Date.between(20.days.ago, Date.today),
    description: Faker::Lorem.paragraph,
    # address: Faker::Address.city
    address: ["amsterdam", "rotterdam", "leiden", "naarden", "den haag", "amstelveen", "dordrecht", "utrecht", "breda", "antwerpen", "venlo", "bilthoven"].sample
    })
  material.save!

end
