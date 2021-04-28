if minetest.get_modpath("schemedit") then
	-- These should only be allowed by those with creative and or give privs
	fsg.add_invalid("schemedit:void")
	fsg.add_invalid("schemedit:creator")
	fsg.add_invalid("schemedit:probtool")
end