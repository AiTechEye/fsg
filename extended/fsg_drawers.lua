if minetest.get_modpath("drawers") then
	-- Add valid
	fsg.add_valid("drawers:wood")
	fsg.add_valid("drawers:acacia_wood")
	fsg.add_valid("drawers:aspen_wood")
	fsg.add_valid("drawers:junglewood")
	fsg.add_valid("drawers:pine_wood")
	if fsg_super_allow then
		fsg.add_valid("drawers:upgrade_template")
		fsg.add_valid("drawers:upgrade_steel")
		fsg.add_valid("drawers:upgrage_gold")
		fsg.add_valid("drawers:upgrade_obsidian")
		fsg.add_valid("drawers:upgrage_diamond")
		fsg.add_valid("drawers:controller")
		if minetest.get_modpath("moreores") then
			fsg.add_valid("drawers:upgrade_mithril")
		end
	end
	-- Add burnable
	fsg.add_burnable("drawers:wood", 4)
	fsg.add_burnable("drawers:acacia_wood", 4)
	fsg.add_burnable("drawers:aspen_wood", 4)
	fsg.add_burnable("drawers:junglewood", 4)
	fsg.add_burnable("drawers:pine_wood", 4)
end