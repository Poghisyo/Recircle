require "cloudinary"
include CloudinaryHelper

puts 'cleaning database'
Message.destroy_all
Favourite.destroy_all
Purchase.destroy_all
Material.destroy_all
Chat.destroy_all
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

  title = {
    "grass" => ["Beautiful Lawn Trimmings", "Excess field grass", "Old park cuttings"],
    "flower cuttings" => ["Garden excess", "Bridal flower leftovers", "Decorative flower arrangements"],
    "hedge trimmings" => ["Garden manor hedges", "Royal garden trimmage"],
    "nails" => ["Almost new drywall nails", "Annular ring shanks"],
    "wiring" => ["1/4 inch electrical wire", "900 meters new cable wires"],
    "machine parts" => ["discarded engine clutches", "1/3 inch roller bearings"],
    "rubble" => ["Crushed granite", "Useable mason stone"],
    "glass bottles" => [ "resuable transparent bottles", "100 champaigne bottles"],
    "broken glassware" => [ "crushed bottle glass"],
    "light bulbs" => ["Incandescent Bulbs", "Halogen Bulbs", "Compact Fluorescent Light Bulbs"],
    "leftovers" => ["Catering leftovers fresh", "thanksgiving leftovers" ],
    "organics" => ["oddly shaped fruit", "post-dated vegetables" ],
    "plastic bottles" => ["Polyethylene terephthalate bottles", "Polyvinyl chloride bottles"],
    "rubber" => ["mint condition rubber tires"],
    "industrial plastic" => ["Low Density Polyethylene", "Polystyrene (PS)"],
    "cardboard" => ["White Lined Chipboard", "Honeycomb Board", "Corrugated Fiberboard"],
    "discarded paper" => ["pasteboard", "Coated paper: glossy and matte surface"],
    "woodchips" => ["Maple Wood Chips", "natural bark mulch"],
    "unrefined wood" => ["Treated Savannah wood", "Softwood Lumber", "oak planks"],
    "sawdust" => ["pine shavings", "horse stall bedding"]
  }

  material = Material.new({
    seller: user,
    # category: Faker::Commerce.material,
    category: category,
    remote_photo_url: photos[category],
    title: title[category].sample, #Faker::Commerce.product_name,
    price: Faker::Number.between(20, 3000),
    supplier: Faker::Company.name,
    created_at: Faker::Date.between(20.days.ago, Date.today),
    description: Faker::Lorem.paragraph,
    # address: Faker::Address.city
    address: [
      "Leidsestraat 142, amsterdam",
      "Prins Hendrikkade 20, 1012 TL Amsterdam",
      "Westerstraat 79I, 1015 LW Amsterdam",
      "Nieuwezijds Voorburgwal 226, 1012 Amsterdam",
      "Van Baerlestraat 33A, 1071 AP Amsterdam",
      "Sierplein 78, 1065 LN Amsterdam",
      "Maalderij 31, 1185 ZC Amstelveen",
      "Jodenbreestraat 21, 1011 NH Amsterdam",
      "Koningsplein 4, 1017 BB Amsterdam",
      "Stadhouderskade 101D, 1073 AW Amsterdam",
      "Amsterdamseweg 73, 1182 GP Amstelveen",
      "Diemerplein 200, 1111 JD Diemen",
      "Albert Schweitzersingel 92, 3822 BX Amersfoort",
      "Stationsplein 7, 1211 EX Hilversum",
      "Damstraat 37, 3531 BS Utrecht",
      "Markenburg 99, 2135 DS Hoofddorp",
      "Hermesweg 6, 3741 GP Baarn",
      "Kon. Julianaplein 63, 2595 AA Den Haag",
      "Sint-Jobsweg 116, 3024 EJ Rotterdam",
      "Dennenlaan 45, 1161 CL Zwanenburg",
      "Grote Marktstraat 55A, 2511 BH Den Haag",
      "Kleiweg 35, 3051 GJ Rotterdam",
      "Beurstraverse 146, 3012 AT Rotterdam",
      "De Kwinkelier 30, 3722 AR Bilthoven",
      "Twijnstraat 8, 3511 ZK Utrecht",
      "Hondsrug 60, 3524 BR Utrecht",
      "Argonautenweg 1, 3054 RP Rotterdam",
      "Stationsplein 19, 3013 AJ Rotterdam",
      "Drossestraat 11, 2011 Haarlem",
      "Smitsweg 20, 3765 CT Soest",
      "Oudedijk 149, 3061 AA Rotterdam",
      "Frederik Hendriklaan 80, 2582 BE Den Haag",
      "Praamplein 4, 1431 Aalsmeer",
      "Aankomstpassage 47, 1118 AX Schiphol",
      "Vondellaan 200, 3521 GZ Utrecht",
      "Markt 50, 2801 JL Gouda",
      "Honingraat 57, 3956 HH Leersum",
      " Hooigracht 85, 2312 KP Leiden",
      "Oudenoord 1, 3513 EG Utrecht",
      "Kopermolen 44, 2317 PB Leiden",
      "Leenderweg 50, 5615 AA Eindhoven",
      " Kloosterstraat 36, 2275 Gierle, Belgium",
      "Zonstraat 28, 7521 HH Enschede",
      "Brabantplein 24, 4817 LR Breda",
      "Buurmalsenplein 1, 5043 XL Tilburg",
      "Voorstraat 38, 3512 AP Utrecht",

      ].sample
    })
  material.save!

end
