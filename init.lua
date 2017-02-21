-- Wild carrot
minetest.override_item("moreflowers:wild_carrot", {
								  drop = {
									  max_items = 1,
									  items = {
										  { items = {"morefarming:seed_wild_carrot"}, rarity = 12},
										  { items = {"moreflowers:wild_carrot"}},
									  }
								  }})

farming.register_plant("morefarming:wild_carrot", {
								  description = "Wild Carrot seed",
								  inventory_image = "morefarming_wild_carrot_seed.png",
								  steps = 8,
								  minlight = 13,
								  maxlight = default.LIGHT_MAX,
								  fertility = {"grassland"},
								  groups = {flammable = 4},
																  })

minetest.override_item("morefarming:wild_carrot_8", {
								  drop = {
									  max_items = 3,
									  items = {
										  { items = {"morefarming:seed_wild_carrot"}, rarity = 6},
										  { items = {"morefarming:seed_carrot"}, rarity = 8},
										  { items = {"morefarming:wild_carrot"}, rarity = 2},
										  { items = {"moreflowers:wild_carrot"}},
									  }
								  }})

minetest.override_item("morefarming:wild_carrot", {
								  on_use = minetest.item_eat(1)
																  })

-- Carrot
farming.register_plant("morefarming:carrot", {
								  description = "Carrot seed",
								  paramtype2 = "meshoptions",
								  inventory_image = "morefarming_carrot_seed.png",
								  steps = 8,
								  minlight = 13,
								  maxlight = default.LIGHT_MAX,
								  fertility = {"grassland"},
								  groups = {flammable = 4},
								  place_param2 = 3,
															})

minetest.override_item("morefarming:carrot", {
								  on_use = minetest.item_eat(4)
															})

-- golden carrot
minetest.register_craftitem("morefarming:carrot_gold", {
										 description = "Golden Carrot",
										 inventory_image = "morefarming_carrot_gold.png",
										 on_use = minetest.item_eat(6),
																		 })

minetest.register_craft({
									output = "morefarming:carrot_gold",
									recipe = {
										{"", "default:gold_lump", ""},
										{"default:gold_lump", "morefarming:carrot", "default:gold_lump"},
										{"", "default:gold_lump", ""},
									}
								})
