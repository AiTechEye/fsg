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
end