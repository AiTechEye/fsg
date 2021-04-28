-- Is the generator craftable? (true/false)
fsg_craft=true

-- Time till the process is done?
-- See below comment on fsg_to_pro
fsg_to_process=100

--[[ Percent of process (I.E. 5/500 = 1, 10/1000 = 1, default=5)
     This is the amount compared to the fsg_to_process.
     That is if process is 100 and this is 1, then something like bucket:bucket_lava set to 80,
     means it will produce 80% of the item. (I.E. default:wood giving say 10 will need 10 items to make 1 item)
--]]
fsg_to_pro=1

-- Items that are invalid to be generated
-- Also could be called a blacklist
fsg_invalid_items={"fsg:gen", "fsg:gen2"}

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
fsg_api_log_level = "verbose"

-- Returns if item was added successfully added (can be thrown away)
function fsg.add_invalid(itemstring)
	-- First check that the itemstring is not already a member
	for k, v in pairs(fsg_invalid_items) do
		if v == itemstring then return false end
	end
	table.insert(fsg_invalid_items, itemstring)
	minetest.log(fsg_api_log_level, "[fsg] Received API call for invalid '"..itemstring.."'.")
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
	minetest.log(fsg_api_log_level, "[fsg] Received API call for valid '"..itemstring.."'.")
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
	fsg_burnable_items.itemstring = time
	minetest.log(fsg_api_log_level, "[fsg] Received API call for burnable '"..itemstring.."' = "..time..".")
	return true
end

function fsg.is_burnable(itemstring)
	for k, v in ipairs(fsg_burnable_items) do
		if k == itemstring then return v end
	end
	return 0
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
