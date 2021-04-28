if minetest.get_modpath("technic") then
	-- Add valid
	fsg.add_valid("technic:uranium_ingot") -- Standard 0.7% (Needs to be ground then processed)
	fsg.add_valid("technic:chromium_ingot")
	fsg.add_valid("technic:zinc_ingot")
	fsg.add_valid("technic:lead_ingot") -- Don't allow Lead blocks as then a Nuclear reactor will be quick and easy to build
	fsg.add_valid("technic:sulfer_dust")
	fsg.add_valid("technic:cast_iron_ingot")
	fsg.add_valid("technic:carbon_steel_ingot")
	fsg.add_valid("technic:stainless_steel_ingot")
	fsg.add_valid("technic:machine_casing")
	fsg.add_valid("technic:carbon_cloth")
	fsg.add_valid("technic:carbon_plate")
	fsg.add_valid("technic:copper_plate")
	fsg.add_valid("technic:composite_plate")
	fsg.add_valid("technic:mixed_metal_ingot")
	fsg.add_valid("technic:control_logic_unit")
	fsg.add_valid("technic:silicon_wafer")
	fsg.add_valid("technic:doped_silicon_wafer")
	fsg.add_valid("technic:blue_energy_crystal") -- Unlock the others by super_allow
	fsg.add_valid("technic:copper_coil")
	fsg.add_valid("technic:graphite")
	fsg.add_valid("technic:rubber")
	fsg.add_valid("technic:battery")
	if fsg_super_allow then
		fsg.add_valid("technic:uranium35_ingot") -- Just need 5 of them and then crafted
		fsg.add_valid("technic:green_energy_crystal")
		fsg.add_valid("technic:red_energy_crystal")
		fsg.add_valid("technic:diamond_drill_head")
	end
	-- Add burnable
	fsg.add_burnable("technic:uranium_lump", 5)
	fsg.add_burnable("technic:uranium_block", (7*9)) -- Lazy, let lua do the math
	fsg.add_burnable("technic:uranium_ingot", 7)
	fsg.add_burnable("technic:uranium35_ingot", 35)
	fsg.add_burnable("technic:uranium35_block", (35*9)) -- Lazy, let lua do the math
	fsg.add_burnable("technic:sulfer_lump", 10)
	fsg.add_burnable("technic:sulfer_dust", 9)
end