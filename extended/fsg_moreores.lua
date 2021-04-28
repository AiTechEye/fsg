if minetest.get_modpath("moreores") then
	-- Add valid
	fsg.add_valid("moreores:silver_ingot")
	fsg.add_valid("moreores:mithril_ingot")
	if minetest.get_modpath("carts") then
		fsg.add_valid("moreores:copper_rail")
	end
end