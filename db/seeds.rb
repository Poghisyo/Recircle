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
    "grass" => cl_image_path("grass-compressor_qtfn8v.jpg"),
    "flower cuttings" => cl_image_path("flower_cuttings-compressor_wt5nxe.jpg"),
    "hedge trimmings" => cl_image_path("hedge_trimmings_dw9js7.webp"),
    "nails" => cl_image_path("construction_metals_jl0vug.jpg"),
    "wiring" => cl_image_path("wiring_ddyc2g.jpg"),
    "machine parts" => cl_image_path("machine_parts_ujvrla.jpg"),
    "rubble" => cl_image_path("rubble_zuf5rm.jpg"),
    "glass bottles" => cl_image_path("glass_bottles_oew8ia.jpg"),
    "broken glassware" => cl_image_path("broken_glassware_icqiey.jpg"),
    "light bulbs" => cl_image_path("lightbulbs_x0hnu1.jpg"),
    "leftovers" => cl_image_path("leftovers_eixwvx.jpg"),
    "organics" => cl_image_path("organics-compressor_mun1xm.jpg"),
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

description = {
 "grass" => "In addition to doing all the things other biodegradable mulches do (retain soil moisture, block light to weeds, improve soil), grass clipping mulch contains so much nitrogen and potassium that it serves as a supplemental fertilizer.",
 "flower cuttings" => "These are usually made up from combinations of peat moss, perlite, vermiculite, sand or similar materials. The primary role of a propagation medium is to provide support and moisture while the plant is developing. These requirements are quite different from those of a potting medium, which may have to sustain a mature or growing plant over a long period of time.",
 "hedge trimmings" => "Save yourself the back ache and follow the steps in this video. Easier maintenance always begins with the proper tools. Lay down a drop cloth to avoid debris, and make sure you remove wayward branches. Doing the hedge trimming will be a snap from now on!",
 "nails" => "6d Ring shank Copper Slating NailsThese Roofing nails are 2\" length made of .134\" (10 Gauge) RING shank Solid Copper. Large 3/8\" diameter flat head, regular diamond point. Ring shank nails, also known as annular thread, offer superior holding power in wood and plywood roof decks. For slate roofs choose correct nail length by adding one inch to twice the thickness of slates. Total 1 pound. Approximately 93 nails per pound.",
 "wiring" => "Wire is a single electrical conductor, whereas a cable is a group of wires swathed in sheathing. The term cable originally referred to a nautical line of multiple ropes used to anchor ships, and in an electrical context, cables (like wires) are used to carry electrical currents.",
 "machine parts" => "Brewer GE 2002 Golden Eagle Chamfer. We have 2 of these BRAND NEW machines in stock and ready for immediate delivery! (video may not be the exact machine listed for sale and is for illustration purposes only",
 "rubble" => "Stabilized Decomposed Granite and Stabilized Crushed Stone are the most widely used natural alternatives to asphalt and concrete pathways. To us, having the heritage of creating the Stabilized category means being committed to always improving it. More stringent testing, soil particle size engineering, proprietary mixing procedures, and Stabilizer- the only patented natural soil binder, are just a few reasons why our Original Stabilized Decomposed Granite and Stabilized Crushed Stone are the most widely used natural alternatives for accessible pathways.",
 "glass bottles" => "Different sizes of Cogelme Glass Crushers can process from 4 to 24 t/h of glass bottles. Thanks to high efficiency and low operating costs, for many years Cogelme Glass Crusher has been chosen and used by the main European glass bottles recyclers and glass factories.",
 "broken glassware" => "When selecting glassware, determine the compatibility of the glassware with the chemicals or process.  Some chemicals react with glass or cause damage (etch) glass.  If your process involves temperature or pressure changes, ensure the glassware can withstand the changes.",
 "light bulbs" => "Energy efficient light bulbs are a type of fluorescent lamp and can be recycled at local recycling centres. Older style 'incandescent' bulbs aren't recyclable and should be thrown away in your rubbish bin.",
 "leftovers" => "Too Good To Go, an app operating in the UK, allows users to order leftover food at a discount from restaurants, according to the website. The goal is to help curb waste from establishments that typically toss out perfectly edible food at the end of the day.",
 "organics" => "Organic sales encompasses those streams of revenue that are a direct result of the firm's existing operations. To generate external sales, the company would look for potential acquisition targets which would help increase top line growth.",
 "plastic bottles" => "We offer a variety of individually priced and wholesale plastic bottles, from boston rounds, honey bear bottles, spice jars, drink bottles, and many more. Sizes range from small 1/2 oz. bottles to larger 2.5 gallon jugs.",
 "rubber" => "You can recycle into other rubber products or to retread and resell. By taking advantage of these services, and a service stations' desire to remove old tires, you can recycle tires for a nice supplementary source of income.",
 "industrial plastic" => "A vast inventory of used plastic granulators for crushing larger plastic materials and the recycling and reuse of plastic materials for a broad range of industry applications are available from Arlington Machinery." ,
 "cardboard" => "Cheap used moving boxes and cardboard boxes for sale! UCB is the cheapest, easiest, and most earth-friendly way to get cardboard boxes and moving boxes.",
 "discarded paper" => "This is the fibrous material used to make paper. Recovered material. Materials and byproducts that have known recycling potential, and that have been removed or diverted from solid waste, or that have never been discarded as solid waste and are intended for sale, use, reuse.",
 "woodchips" => "Wood Chips are a great natural timber felling By-Product, ideal for various usage options, e.g.. - as an inexpensive, hard wearing surface for in/ outdoor riding arenas. - equine paddocks or cattle stand-off winter pads. - playground fall-protection. - garden mulch as an effective weed suppressive",
 "unrefined wood" => "Unrefined wood is a common material that can be found by cutting down certain types of trees with a Matter Manipulator, axe, or pickaxe. It can be crafted into Wood Planks and, along with coal ore, can be used to make torches. ",
 "sawdust" => "A wide variety of wood shavings machine for sale options are available to you, such as free samples, paid samples. ... Wood Sawdust Machine for Sale/Wood Shaving Machine for Horse Bedding/Sawdust",
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
    description: description[category],
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
