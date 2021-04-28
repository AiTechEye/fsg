if minetest.get_modpath("airtanks") then
	-- Add valid
	fsg.add_valid("airtanks:breathing_tube")
	fsg.add_valid("airtanks:compressor")
	if fsg_super_allow then
		fsg.add_valid("airtanks:steel_tank")
		fsg.add_valid("airtanks:copper_tank")
		fsg.add_valid("airtanks:bronze_tank")
	end
end