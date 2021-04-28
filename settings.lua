-- Is the generator craftable? (true/false)
fsg_craft=true

-- Time till the process is done?
fsg_to_process=255

-- Shows in X percent (I.E. shows in % example: 5/500 = 1)
fsg_to_pro=5

-- Items that are invalid to be generated
fsg_invalid_items={"fsg:gen"}

-- Allow everything not in fsg_invalid_items? (Doesn't use fsg_valid to check it's something to use)
-- Quite dangerous since it accepts almost everything (Except fsg_invalid_items)
fsg_accept_all = false

-- Allow normal valid items including an extra set of them
fsg_super_allow = false

-- Items that can be generated (Use fsg_accept_all to accept everything and not need to populate this
fsg_valid_items={}
fsg_burnable_items = {}

-- API begins --
-- Just uses the fsg namespace (See examples.lua)

-- Returns if item was added successfully added (can be thrown away)
function fsg.add_invalid(itemstring)
	-- First check that the itemstring is not already a member
	for k, v in pairs(fsg_invalid_items) do
		if v == itemstring then return false end
	end
	table.insert(fsg_invalid_items, itemstring)
end

-- Returns if item was added successfully added (can be thrown away)
function fsg.add_valid(itemstring)
	-- First check that the itemstring is not already a member
	for k, v in pairs(fsg_valid_items) do
		if v == itemstring then return false end
	end
	table.insert(fsg_valid_items, itemstring)
end

-- Returns if item was added successfully (can be thrown away)
function fsg.add_burnable(itemstring, time)
	-- First check that the itemstring is not already a member
	-- I need to add a update function since this ensures no dupes
	for k, v in ipairs(fsg_invalid_items) do
		if k == itemstring then return false end
	end
	fsg_invalid_items[itemstring] = time
end

-- End of API --

-- Lets add some stuff!
-- Moved to entended folder

local fsg_mods = {
	"default",
	"moreores",
	"moreblocks",
	"laptop",
	"technic",
	"drawers",
	"airtanks",
	"schemedit",
}
for k, v in pairs(fsg_mods) do
	dofile(fsg_modpath.."/extended/fsg_"..v..".lua")
end
