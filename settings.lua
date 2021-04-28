-- Is the generator craftable? (true/false)
fsg_craft=true

-- Time till the process is done?
fsg_to_process=100

-- Shows in X percent (I.E. shows in % example: 5/500 = 1)
fsg_to_pro=5

-- Items that are invalid to be generated
-- Also could be called a blacklist
fsg_invalid_items={"fsg:gen"}

-- Allow everything not in fsg_invalid_items? (Doesn't use fsg_valid to check it's something to use)
-- Quite dangerous since it accepts almost everything (Except fsg_invalid_items)
fsg_allow_all = false

-- Allow normal valid items including an extra set of them
fsg_super_allow = false

-- Items that can be generated (Use fsg_allow_all to accept everything and not need to populate this)
fsg_valid_items={}

-- Allow anything to burn
fsg_allow_all_burns = true

-- If it's not in fsg_burnable_items what is it's burn amount?
fsg_unknown_burn = 1

-- Items in this will burn for their amounts defined in here
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
	return true
end

function fsg.is_invalid(itemstring)
	for k, v in pairs(fsg_invalid_items) do
		if v == itemstring then return true end
	end
	return false
end

-- Returns if item was added successfully added (can be thrown away)
function fsg.add_valid(itemstring)
	-- First check that the itemstring is not already a member
	for k, v in pairs(fsg_valid_items) do
		if v == itemstring then return false end
	end
	table.insert(fsg_valid_items, itemstring)
	return true
end

function fsg.is_valid(itemstring)
	for k, v in pairs(fsg_valid_items) do
		if v == itemstring then return true end
	end
	return false
end

-- Returns if item was added successfully (can be thrown away)
function fsg.add_burnable(itemstring, time)
	-- First check that the itemstring is not already a member
	-- I need to add a update function since this ensures no dupes
	for k, v in ipairs(fsg_burnable_items) do
		if k == itemstring then return false end
	end
	fsg_burnable_items[itemstring] = time
	return true
end

function fsg.is_burnable(itemstring)
	for k, v in ipairs(fsg_burnable_items) do
		if k == itemstring then return true end
	end
	return false
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
	minetest.log("action", "[fsg] Loading mod '"..v.."' from '"..fsg_modpath.."/extended/fsg_"..v..".lua".."'.")
	dofile(fsg_modpath.."/extended/fsg_"..v..".lua")
end
minetest.log("action", "[fsg] Loaded "..table.maxn(fsg_mods).." mods!")
