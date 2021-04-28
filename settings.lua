
-- Is the generator craftable? (true/false)
fsg_craft=true

-- Time till the process is done?
fsg_to_process=500

-- Shows in X percent (I.E. shows in % example: 5/500 = 1)
fsg_to_pro=5

-- Items that are invalid to be generated
fsg_invalid_items={
	"fsg:gen", -- Of course we don't allow the item generator to be generated
--	"default:",
	"fire:permanent_flame",
	"default:cloud",
	if rawget(_G, "schemedit") then
	-- These should only be allowed by those with creative and or give privs
--		"schemedit:",
		"schemedit:void",
		"schemedit:creator",
		"schemedit:probtool",
	end
}

-- Allow everything not in fsg_invalid_items? (Doesn't use fsg_valid to check it's something to use)
-- Quite dangerous since it accepts almost everything (Except fsg_invalid_items)
fsg_accept_all = false

-- Allow normal valid items including an extra set of them
fsg_super_allow = false

-- Items that can be generated (Use fsg_accept_all to accept everything and not need to populate this
-- By default let's include some stuff but not a whole lot.
fsg_valid_items={
--	"default:",
	"default:coal_lump",
	"default:coalblock",
	"default:steel_ingot",
	"default:steelblock",
	"default:gold_ingot",
	"default:goldblock",
	"default:copper_ingot",
	"default:copperblock",
	"default:tin_ingot",
	"default:tinblock",
	"default:bronze_ingot",
	"default:bronzeblock",
	"default:clay_brick",
	"default:obsidan",
	"default:mese_crystal",
	"default:mese",
	"default:diamond",
	-- Limit diamond so it's more valuable (reduces the amout of fsg:gen someone could build)
	if fsg_super_allow then
		"default:diamondblock",
	end
	"default:water_source",
	"default:river_water_source",
	"default:lava_source",
	"dye:white",
	"dye:grey",
	"dye:dark_grey",
	"dye:black",
	"dye:blue",
	"dye:cyan",
	"dye:green",
	"dye:dark_green",
	"dye:yellow",
	"dye:orange",
	"dye:brown",
	"dye:red",
	"dye:pink",
	"dye:magenta",
	"dye:violet",
	"default:wool",
	"default:sapling",
	"default:tree",
	"default:wood",
	"default:leaves",
	"default:dirt_with_grass",
	"default:stone",
	"default:gravel",
	"default:sand",
	"default:desert_stone",
	"default:sandstone",
	"default:desert_sandstone",
	"default:papyrus",
	"default:cactus",
	"default:apple",
	"fireflies:firefly",
	"default:coral_brown",
	"default:coral_orange",
	"default:coral_skeleton",
	"default:kelp",
	"default:snow",
	"default:ice",
	"default:torch",
	"default:meselamp",
	"farming:seed_cotton",
	"farming:seed_wheat",
	"default:blueberries",
	"flowers:mushroom_brown",
	"flowers:mushroom_red",
	"farming:bread",
	"tnt:gunpowder",
	"tnt:tnt",
	"tnt:tnt_stick",
	"default:chest",
	"default:furnace",
	"default:chest_locked",
	"carts:rail",
	"carts:powerrail",
	"carts:brakerail",
	"carts:cart",
	"boats:boat",
	"default:flint",
	"beds:bed_bottom",
	"beds:fancy_bed_bottom",
	if rawget(_G, "technic") then
--		"technic:",
		"technic:uranium_ingot", -- Standard 0.7% (Needs to be ground then processed)
		"technic:chromium_ingot",
		"technic:zinc_ingot",
		"technic:lead_ingot", -- Don't allow Lead blocks as then a Nuclear reactor will be quick and easy to build
		"technic:sulfer_dust",
		"technic:cast_iron_ingot",
		"technic:carbon_steel_ingot",
		"technic:stainless_steel_ingot",
		"technic:machine_casing",
		"technic:carbon_cloth",
		"technic:carbon_plate",
		"technic:copper_plate",
		"technic:composite_plate",
		"technic:mixed_metal_ingot",
		"technic:control_logic_unit",
		"technic:silicon_wafer",
		"technic:doped_silicon_wafer",
		"technic:blue_energy_crystal", -- Unlock the others by super_allow
		"technic:copper_coil",
		"technic:graphite",
		"technic:rubber",
		"technic:battery",
		if fsg_super_allow then
--			"technic:",
			"technic:uranium35_ingot", -- Just need 5 of them and then crafted
			"technic:green_energy_crystal",
			"technic:red_energy_crystal",
			"technic:diamond_drill_head",
		end
	end
	if rawget(_G, "moreblocks") then
--		"moreblocks:",
		"moreblocks:sweeper",
		"moreblocks:circular_saw",
		"moreblocks:glow_glass",
		"moreblocks:super_glow_glass",
		"moreblocks:cobble_compressed",
		"moreblocks:dirt_compressed",
		"moreblocks:desert_cobble_compressed",
	end
	if rawget(_G, "laptop") then
--		"laptop:",
		"laptop:cpu_c6",
		"laptop:cpu_d75a",
		"laptop:cpu_jetcore",
		"laptop:cpu_65536",
		"laptop:bat",
		"laptop:case",
		"laptop:crt",
		"laptop:crt_amber",
		"laptop:crt_green",
		"laptop:lcd",
		"laptop:gpu",
		"laptop:HDD",
		"laptop:motherboard",
		"laptop:fan",
		"laptop:psu",
		"laptop:floppy", -- Datastorage
		if fsg_super_allow then
			"laptop:usbstick", -- Datastorage
			"laptop:core", -- Laptop
			"laptop:printer",
			"laptop:fruit_zero", -- Computer
		end
	end
	if rawget(_G, "drawers") then
--		"drawers:",
		"drawers:wood",
		"drawers:acacia_wood",
		"drawers:aspen_wood",
		"drawers:junglewood",
		"drawers:pine_wood",
		if fsg_super_allow then
			"drawers:upgrade_template",
			"drawers:upgrade_steel",
			"drawers:upgrage_gold",
			"drawers:upgrade_obsidian",
			"drawers:upgrage_diamond",
			"drawers:controller",
			if rawget(_G, "moreores") then
				"drawers:upgrade_mithril",
			end
		end
	end
	if rawget(_G, "moreores") then
--		"moreores:",
		"moreores:silver_ingot",
		"moreores:mithril_ingot",
		if rawget(_G, "carts") then
			"moreores:copper_rail",
		end
	end
	if rawget(_G, "airtanks") then
--		"airtanks:",
		"airtanks:breathing_tube",
		"airtanks:compressor",
		if fsg_super_allow then
			"airtanks:steel_tank",
			"airtanks:copper_tank",
			"airtanks:bronze_tank",
		end
	end
}

-- If an item is not in fsg_burnable AND fsg_allow_all_burns is true then we allow everything to burn
fsg_allow_all_burns = true
fgs_unkown_burn = 1 -- The amount something unkown will burn

-- Any item here that will "burn" with given time
fsg_burnable_items = {
--	["default:"]=1,
	["default:coal_lump"]=10,
	["default:coalblock"]=40,
	["default:lava_source"]=80,
	["default:dirt"]=2,
	["default:cobble"]=3,
	["default:desert_cobble"]=3,
	["default:mossycobble"]=3,
	["default:sand"]=1,
	["default:silver_sand"]=1,
	["default:desert_sand"]=1,
	["default:snow"]=1,
	["default:snowblock"]=9,
	if rawget(_G, "technic") then
--		["technic:"]=1,
		["technic:uranium_lump"]=5,
		["technic:uranium_block"]=(7*9), -- Lazy, let lua do the math
		["technic:uranium_ingot"]=7,
		["technic:uranium35_ingot"]=35,
		["technic:uranium35_block"]=(35*9), -- Lazy, let lua do the math
		["technic:sulfer_lump"]=10,
		["technic:sulfer_dust"]=9,
	end
	if rawget(_G, "drawers") then
--		["drawers:"]=1,
		["drawers:wood"]=4,
		["drawers:acacia_wood"]=4,
		["drawers:aspen_wood"]=4,
		["drawers:junglewood"]=4,
		["drawers:pine_wood"]=4,
	end
	-- Remeber if fsg_allow_all_burns is true then we will use anything and everything (Not just what's here)
}
