if minetest.get_modpath("laptop") then
	-- Add valid
	fsg.add_valid("laptop:cpu_c6")
	fsg.add_valid("laptop:cpu_d75a")
	fsg.add_valid("laptop:cpu_jetcore")
	fsg.add_valid("laptop:cpu_65536")
	fsg.add_valid("laptop:bat")
	fsg.add_valid("laptop:case")
	fsg.add_valid("laptop:crt")
	fsg.add_valid("laptop:crt_amber")
	fsg.add_valid("laptop:crt_green")
	fsg.add_valid("laptop:lcd")
	fsg.add_valid("laptop:gpu")
	fsg.add_valid("laptop:HDD")
	fsg.add_valid("laptop:motherboard")
	fsg.add_valid("laptop:fan")
	fsg.add_valid("laptop:psu")
	fsg.add_valid("laptop:floppy") -- Datastorage
	if fsg_super_allow then
		fsg.add_valid("laptop:usbstick") -- Datastorage
		fsg.add_valid("laptop:core") -- Laptop
		fsg.add_valid("laptop:printer")
		fsg.add_valid("laptop:fruit_zero") -- Computer
	end
end