-- Attemps to grab fsg API
local fsg = rawget(_G, "fsg") or nil

-- If successful use it
if fsg ~= nil then
	-- Adds a invalid item via API call
	fsg.add_invalid("default:air")

	-- Add a valid item
	fsg.add_valid("default:chest_locked")

	-- Make a item burnable
	fsg.add_burnable("default:chest", 12) -- Note: This does NOT add it to valid or invalid only burnable!
	
	-- Tests if default:air is invalid should equal true
	if fsg.is_invalid("default:air") then
		print("Air is not allowed.")
	else
		print("Air is allowed?")
	end

	-- Let's see how much a "default:coal_lump" burns
	local coal_lump = fsg.is_burnable("default:coal_lump")
	if coal_lump ~= 0 then
		print("A peice of Coal will burn for "..coal_lump..".")
	else
		print("A peice of Coal will not burn? (Unless fsg_allow_all_burns is true)")
	end
end