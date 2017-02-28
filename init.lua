--------------------------------------------------------------------------------
-- morefarming mod
-- by sys4
--------------------------------------------------------------------------------

local redo = farming.mod and farming.mod == "redo"
local plus = minetest.get_modpath("farming_plus")

-- Wild carrot
minetest.override_item("moreflowers:wild_carrot", {
								  drop = {
									  max_items = 1,
									  items = {
										  { items = {"morefarming:seed_wildcarrot"}, rarity = 12},
										  { items = {"moreflowers:wild_carrot"}},
									  }
								  }})

farming.register_plant("morefarming:wildcarrot", {
								  description = "Wild Carrot seed",
								  inventory_image = "morefarming_wildcarrot_seed.png",
								  steps = 8,
								  minlight = 13,
								  maxlight = default.LIGHT_MAX,
								  fertility = {"grassland"},
								  groups = {flammable = 4},
																  })

local carrot_seed = "morefarming:seed_carrot"
if redo then carrot_seed = "farming:carrot" end
if plus then carrot_seed = "farming_plus:carrot_seed" end

minetest.override_item("morefarming:wildcarrot_8", {
								  drop = {
									  max_items = 3,
									  items = {
										  { items = {"morefarming:seed_wildcarrot"}, rarity = 6},
										  { items = {carrot_seed}, rarity = 8},
										  { items = {"morefarming:wildcarrot"}, rarity = 2},
										  { items = {"moreflowers:wild_carrot"}},
									  }
								  }})

minetest.override_item("morefarming:wildcarrot", {
								  on_use = minetest.item_eat(1)
																  })

if not redo and not plus then
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
end

local carrot_item = "morefarming:carrot"
if plus then carrot_item = "farming_plus:carrot_item" end

if not redo then
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
											{"default:gold_lump", carrot_item, "default:gold_lump"},
											{"", "default:gold_lump", ""},
										}
									})
elseif plus then
	minetest.register_craft({
										output = "farming:carrot_gold",
										recipe = {
											{"", "default:gold_lump", ""},
											{"default:gold_lump", carrot_item, "default:gold_lump"},
											{"", "default:gold_lump", ""},
										}
									})
end

-- Maidroid behaviour
if not redo and not plus and minetest.get_modpath("maidroid_core") then
	minetest.registered_items["moreflowers:wild_carrot"].groups["seed"] = 1
	dofile(minetest.get_modpath("morefarming").."/maidroid_core_morefarming.lua")
end

-- bonemeal behaviour
if minetest.get_modpath("bonemeal") and bonemeal then
	
	bonemeal:add_crop({{"morefarming:wildcarrot_", 8, "morefarming:seed_wildcarrot"}})
	
	if not redo and not plus then
		bonemeal:add_crop({{"morefarming:carrot_", 8, "morefarming:seed_carrot"}})
	end
end
