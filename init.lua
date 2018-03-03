--------------------------------------------------------------------------------
-- morefarming mod
-- by sys4
--------------------------------------------------------------------------------

local redo = farming.mod and farming.mod == "redo"
local plus = minetest.get_modpath("farming_plus")

local function item_eat(hunger_change, replace_with_item, poisen, heal)
	if diet then
		return diet.item_eat(hunger_change, replace_with_item, poisen, heal)
	else
		return minetest.item_eat(hunger_change)
	end
end

-- Override flowers --
--
minetest.override_item(
	"moreflowers:wild_carrot",	{
		drop = {
			max_items = 1,
			items = {
				{ items = {"morefarming:seed_wildcarrot"}, rarity = 12},
				{ items = {"moreflowers:wild_carrot"}},
			}
		}})

minetest.override_item(
	"moreflowers:teosinte", {
		drop = {
			max_items = 1,
			items = {
				{ items = {"morefarming:seed_teosinte"}, rarity = 6},
				{ items = {"moreflowers:teosinte"}},
			}
		}})


-- Register morefarming plants --
--
-- Wild Carrot
farming.register_plant(
	"morefarming:wildcarrot",
	{
		description = "Wild Carrot seed",
		inventory_image = "morefarming_wildcarrot_seed.png",
		steps = 8,
		minlight = 13,
		maxlight = default.LIGHT_MAX,
		fertility = {"grassland"},
		groups = {flammable = 4},
	})

minetest.override_item(
	"morefarming:wildcarrot",
	{
		on_use = item_eat(1)
	})

-- Teosinte
farming.register_plant(
	"morefarming:teosinte",
	{
		description = "Teosinte seed",
		inventory_image = "morefarming_teosinte_seed.png",
		steps = 8,
		minlight = 13,
		maxlight = default.LIGHT_MAX,
		fertility = {"grassland", "desert"},
		groups = {flammable = 4},
	})

for i=1, 8 do
	minetest.override_item(
		"morefarming:teosinte_"..i,
		{
			visual_scale = 1.3
		})
end

if not redo and not plus then
	-- Carrot
	farming.register_plant(
		"morefarming:carrot",
		{
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
	
	minetest.override_item(
		"morefarming:carrot",
		{
			on_use = item_eat(2)
		})
end

if not redo then
	-- Corn
	farming.register_plant(
		"morefarming:corn",
		{
			description = "Corn seed",
			inventory_image = "morefarming_corn_seed.png",
			steps = 8,
			minlight = 13,
			maxlight = default.LIGHT_MAX,
			fertility = {"grassland", "desert"},
			groups = {flammable = 4},
		})

	for i=1, 8 do
		minetest.override_item(
			"morefarming:corn_"..i,
			{
				visual_scale = 1.6
			})
	end
	
	minetest.override_item(
		"morefarming:corn",
		{
			on_use = item_eat(3)
		})
	
end

-- Override mature plants--
--
local carrot_seed = "morefarming:seed_carrot"
local corn_seed = "morefarming:seed_corn"

if redo then
	carrot_seed = "farming:carrot"
	corn_seed = "farming:corn"
end

if plus then
	carrot_seed = "farming_plus:carrot_seed"
end

-- Wild Carrot
minetest.override_item(
	"morefarming:wildcarrot_8", {
		drop = {
			max_items = 3,
			items = {
				{ items = {"morefarming:seed_wildcarrot"}, rarity = 6},
				{ items = {carrot_seed}, rarity = 8},
				{ items = {"morefarming:wildcarrot"}, rarity = 2},
				{ items = {"moreflowers:wild_carrot"}},
			}
		}})

-- Teosinte
minetest.override_item(
	"morefarming:teosinte_8", {
		drop = {
			max_items = 3,
			items = {
				{ items = {"morefarming:seed_teosinte"}, rarity = 3},
				{ items = {corn_seed}, rarity = 8},
				{ items = {"morefarming:teosinte"}, rarity = 2},
				{ items = {"moreflowers:teosinte"}},
			}
		}})

-- Register craftitems
--
local carrot_item = "morefarming:carrot"
local corn_item = "morefarming:corn"

if plus then
	carrot_item = "farming_plus:carrot_item"
end
	
if not redo then

	-- golden carrot
	minetest.register_craftitem(
		"morefarming:carrot_gold",
		{
			description = "Golden Carrot",
			inventory_image = "morefarming_carrot_gold.png",
			on_use = item_eat(6, "", nil, 20),
		})
	
	minetest.register_craft(
		{
			output = "morefarming:carrot_gold",
			recipe = {
				{"", "default:gold_lump", ""},
				{"default:gold_lump", carrot_item, "default:gold_lump"},
				{"", "default:gold_lump", ""},
			}
		})

	-- Corn on the cob
	minetest.register_craftitem(
		"morefarming:corn_cooked",
		{
			description = "Corn on the Cob",
			inventory_image = "morefarming_corn_cooked.png",
			on_use = item_eat(5),
		})

	minetest.register_craft(
		{
			type = "cooking",
			cooktime = 10,
			output = "morefarming:corn_cooked",
			recipe = "morefarming:corn"
		})

	if minetest.get_modpath("vessels") then
		-- Chicha (Ethanol equivalent ;)
		minetest.register_craftitem(
			"morefarming:chicha",
			{
				description = "Chicha",
				inventory_image = "morefarming_chicha.png",
				on_use = item_eat(2, "vessels:glass_bottle", 2)
			})
		
		minetest.register_craft(
			{
				output = "morefarming:chicha 2",
				recipe = {
					{ "vessels:glass_bottle", "vessels:glass_bottle", "morefarming:corn"},
					{ "morefarming:corn", "morefarming:corn", "morefarming:corn"},
				}
			})

		minetest.register_craft(
			{
				output = "morefarming:chicha",
				recipe = {
					{ "vessels:glass_bottle", "morefarming:teosinte", "morefarming:teosinte"},
					{ "morefarming:teosinte", "morefarming:teosinte", "morefarming:teosinte"},
				}
			})

		minetest.register_craft(
			{
				type = "fuel",
				recipe = "morefarming:chicha",
				burntime = 240,
				replacements = {{"morefarming:chicha", "vessels:glass_bottle"}}
			})
	end
		
elseif plus then
	-- Golden Carrot
	minetest.register_craft(
		{
			output = "farming:carrot_gold",
			recipe = {
				{"", "default:gold_lump", ""},
				{"default:gold_lump", carrot_item, "default:gold_lump"},
				{"", "default:gold_lump", ""},
			}
		})
end

if redo then

	if minetest.get_modpath("vessels") then
		-- Bottle of Ethanol
		minetest.clear_craft(
			{
				recipe = {
					{"vessels:glass_bottle", "farming:corn", "farming:corn"},
					{"farming:corn", "farming:corn", "farming:corn"},
				}
			})
		
		minetest.register_craft(
			{
				output = "farming:bottle_ethanol 2",
				recipe = {
					{ "vessels:glass_bottle", "vessels:glass_bottle", "farming:corn"},
					{ "farming:corn", "farming:corn", "farming:corn"},
				}
			})
		
		minetest.register_craft(
			{
				output = "farming:bottle_ethanol",
				recipe = {
					{ "vessels:glass_bottle", "morefarming:teosinte", "morefarming:teosinte"},
					{ "morefarming:teosinte", "morefarming:teosinte", "morefarming:teosinte"},
				}
			})
	end
end


-- Maidroid behaviour
--if not redo and not plus and minetest.get_modpath("maidroid_core") then
if minetest.get_modpath("maidroid_core") then

	local wild_plants = {
		"moreflowers:wild_carrot",
		"moreflowers:teosinte",
	}

	for _, item in pairs(wild_plants) do
		minetest.registered_items[item].groups["seed"] = 1
	end

	if redo then
		local redo_plants = {
			"farming:seed_barley",
			"farming:blueberries",
			"farming:carrot",
			"farming:coffee_beans",
			"farming:corn",
			"farming:cucumber",
			"farming:melon_slice",
			"farming:potato",
			"farming:pumpkin_slice",
			"farming:raspberries",
			"farming:rhubarb",
			"farming:tomato",
		}

		for _, item in pairs(redo_plants) do
			local groups = minetest.registered_items[item].groups
			if groups then
				groups.seed = 1
				groups.redo = 1
			else
				groups = {seed = 1, redo = 1}
			end
			minetest.override_item(
				item,
				{
					groups = groups
				})
		end
	end

	if plus then
		local plus_plants = {
			"farming_plus:carrot_seed",
			"farming_plus:orange_seed",
			"farming_plus:potato_seed",
			"farming_plus:rhubarb_seed",
			"farming_plus:strawberry_seed",
			"farming_plus:tomato_seed",
		}

		for _, item in pairs(plus_plants) do
			local groups = minetest.registered_items[item].groups
			if groups then
				groups.seed = 1
				groups.plus = 1
			else
				groups = {seed = 1, plus = 1}
			end
			minetest.override_item(
				item,
				{
					groups = groups
				})
		end
	end

	dofile(minetest.get_modpath("morefarming").."/maidroid_core_morefarming.lua")
end

-- bonemeal behaviour
if minetest.get_modpath("bonemeal") and bonemeal then
	
	bonemeal:add_crop({{"morefarming:wildcarrot_", 8, "morefarming:seed_wildcarrot"}})
	bonemeal:add_crop({{"morefarming:teosinte_", 8, "morefarming:seed_teosinte"}})

	if not redo and not plus then
		bonemeal:add_crop({{"morefarming:carrot_", 8, "morefarming:seed_carrot"}})
	end

	if not redo then
		bonemeal:add_crop({{"morefarming:corn_", 8, "morefarming:seed_corn"}})
	end

	if redo then
		bonemeal:add_crop({{"farming:barley_", 7, "farming:seed_barley"}})
		bonemeal:add_crop({{"farming:blueberry_", 4, "farming:blueberries"}})
		bonemeal:add_crop({{"farming:carrot_", 8, "farming:carrot"}})
		bonemeal:add_crop({{"farming:coffee_", 5, "farming:coffee_beans"}})
		bonemeal:add_crop({{"farming:corn_", 8, "farming:corn"}})
		bonemeal:add_crop({{"farming:cucumber_", 4, "farming:cucumber"}})
		bonemeal:add_crop({{"farming:melon_", 8, "farming:melon_slice"}})
		bonemeal:add_crop({{"farming:potato_", 4, "farming:potato"}})
		bonemeal:add_crop({{"farming:pumpkin_", 8, "farming:pumpkin_slice"}})
		bonemeal:add_crop({{"farming:raspberry_", 4, "farming:raspberries"}})
		bonemeal:add_crop({{"farming:rhubarb_", 3, "farming:rhubarb"}})
		bonemeal:add_crop({{"farming:tomato_", 8, "farming:tomato"}})
	end
end
