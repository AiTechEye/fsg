
fsg_modpath = minetest.get_modpath("fsg")
fsg = {}

-- Moved settings to settings.lua
dofile(fsg_modpath.."/settings.lua")

fsg_update=function (pos, elapsed)
	local meta=minetest.get_meta(pos)
	local inv=meta:get_inventory()
	local gen=inv:get_stack("gen",1):get_name()
	local process=meta:get_int("proc")

	if inv:is_empty("gen") or inv:room_for_item("done",gen)==false or inv:is_empty("burn") then
		minetest.get_node_timer(pos):stop()
		meta:set_int("proc",0)
		if inv:room_for_item("done",gen)==false then meta:set_string("infotext", "Item Generator [Full] (" .. meta:get_string("owner") .. ")") end
		if inv:is_empty("gen") then meta:set_string("infotext", "Item Generator [No Product] (" .. meta:get_string("owner") .. ")") end
		if inv:is_empty("burn") then meta:set_string("infotext", "Item Generator [No Junk] (" .. meta:get_string("owner") .. ")") end


		minetest.swap_node(pos, {name ="fsg:gen"})
		return false
	end
	for i=1,32,1 do
		local t=inv:get_stack("burn",i):get_name()
		if t~="" then
			local p=0
			for k, v in ipairs(fsg_burnable_items) do
				if p==0 and t==k then
					p = v
				end
			end
			-- Process if it's a part of a group
			if p==0 then p=minetest.get_item_group(t, "tree")*5 end
			if p==0 then p=minetest.get_item_group(t, "wood")*6 end
			if p==0 then p=minetest.get_item_group(t, "sapling")*1 end
			if p==0 then p=minetest.get_item_group(t, "snappy")*3 end
			if p==0 then p=minetest.get_item_group(t, "flammable")*3 end
			if p==0 then p=minetest.get_item_group(t, "choppy")*3 end
			if p==0 then p=minetest.get_item_group(t, "hot")*10 end
			if p==0 then p=minetest.get_item_group(t, "igniter")*4 end
			-- In cases where it's not recognized yet they want it allowed
			if p == 0 and fsg_allow_all_burns then
				p = fsg_unknown_burn
			end
			inv:remove_item("burn",t)
			process=process+p
			if process>=fsg_to_process then
				process=process-fsg_to_process
				inv:add_item("done",gen)
			end
			meta:set_int("proc",process)
			meta:set_string("infotext", "Item Generator " .. (process/fsg_to_pro)  .."% (" .. meta:get_string("owner") .. ")")
			break
		end
	end
	return true
end



function fsg_inv(placer,pos)
local meta=minetest.get_meta(pos)
local names=meta:get_string("names")
local op=meta:get_int("open")
local open=""
if op==0 then
	open="Locked"
elseif op==1 then
	open="Members"	
else
	open="Generally"
end
meta:set_string("formspec",
	"size[8,11]" ..
	"list[context;gen;0,0;1,1;]" ..
	"list[context;done;2,0;6,1;]" ..
	"button[0,1; 1.5,1;save;Save]" ..
	"button[0,2; 1.5,1;open;" .. open .."]" ..
	"textarea[2.2,1.3;6,1.8;names;Members list (allow members to take and add);" .. names  .."]"..
	"list[context;burn;0,2.9;8,4;]" ..
	"list[current_player;main;0,7;8,4;]" ..
	"listring[current_player;main]" ..
	"listring[current_name;burn]" ..
	"listring[current_player;main]"  ..
	"listring[current_name;done]"
)
	meta:set_string("infotext", "Item Generator (" .. placer:get_player_name() .. ")")
end

local fsg_for={{7,"_active",1,"default_meselamp.png^default_obsidian_glass.png"},{0,"",0,"default_steel_block.png^default_obsidian_glass.png"}}
for i = 1, #fsg_for, 1 do
minetest.register_node("fsg:gen" .. fsg_for[i][2], {
	description = "Item Generator",
	tiles = {"default_steel_block.png^default_obsidian_glass.png",fsg_for[i][4]},
	groups = {dig_immediate = 3,not_in_creative_inventory = fsg_for[i][3]},
	paramtype2 = "facedir",
	light_source=fsg_for[i][1],
	sounds=default.node_sound_stone_defaults(),
after_place_node = function(pos, placer, itemstack)
		local meta = minetest.get_meta(pos)
		meta:set_string("owner", placer:get_player_name())
		meta:set_int("burning", 0)
		meta:set_int("open", 0)
		meta:set_string("names", "")
		meta:set_int("proc", 0)
		meta:set_int("state", 0)
		meta:set_int("type", fsg_for[i][3])
		local inv = meta:get_inventory()
		inv:set_size("burn", 32)
		inv:set_size("gen", 1)
		inv:set_size("done", 6)
		fsg_inv(placer,pos)
		end,
allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if (fsg_valid_items[1]~=nil) and listname=="gen" then		--accepted things (if something is added)
			local cbg=0
			local item=stack:get_name()
			if not fsg_allow_all then -- Only do this if fsg_allow_all is false (Or undefined)
			    for i, it in pairs(fsg_valid_items) do
				    if it==item then
					    cbg=1
					    break
				    end
			    end
			else cbg=1 end -- Hey look it's a valid item :) (Only if fsg_allow_all is true)
			if cbg==0 then return 0 end
		end
		if listname=="gen" then
			local item=stack:get_name()
			for i, it in pairs(fsg_invalid_items) do --not accepted
				if it==item then return 0 end
			end
		end
		local meta=minetest.get_meta(pos)
		local open=meta:get_int("open")
		local name=player:get_player_name()
		local owner=meta:get_string("owner")
		local count=0
		if name==owner and listname~="done" then count=stack:get_count() end
		if open>0 and listname=="burn" then count=stack:get_count() end
		if count>0 and meta:get_int("type")==0 then
			minetest.get_node_timer(pos):start(1)
			minetest.swap_node(pos, {name ="fsg:gen_active"})
		end
		return count
		end,
allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta=minetest.get_meta(pos)
		local open=meta:get_int("open")
		local name=player:get_player_name()
		local owner=meta:get_string("owner")

		if name==owner then return stack:get_count() end
		if open==2 and (listname=="burn" or listname=="done") then return stack:get_count() end

		if open==1 and (listname=="burn" or listname=="done") then
			local names=meta:get_string("names")
			local txt=names.split(names,"\n")
			for i in pairs(txt) do
				if name==txt[i] then
					return stack:get_count()
				end

			end
		end
		return 0
		end,
can_dig = function(pos, player)
		local meta=minetest.get_meta(pos)
		local owner=meta:get_string("owner")
		local inv=meta:get_inventory()
		return (player:get_player_name()==owner and owner~="" and inv:is_empty("gen") and inv:is_empty("done") and inv:is_empty("burn"))
		end,
allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		if meta:get_int("open")==0 and player:get_player_name()~=minetest.get_meta(pos):get_string("owner") then
			return 0
		end
		if (from_list=="burn" and to_list=="burn") or
		(from_list=="done" and to_list=="done" and player:get_player_name()==minetest.get_meta(pos):get_string("owner")) then
			return count
		end
		return 0
		end,
on_receive_fields = function(pos, formname, fields, sender)
		local meta = minetest.get_meta(pos)
		if sender:get_player_name() ~= meta:get_string("owner") then
			return false
		end

		if fields.save then
			meta:set_string("names", fields.names)
			fsg_inv(sender,pos)
		end

		if fields.open then
			local open=meta:get_int("open")
			open=open+1
			if open>2 then open=0 end
			meta:set_int("open",open)
			fsg_inv(sender,pos)
		end
end,
on_timer = fsg_update,
})

end

if fsg_craft~=false then
minetest.register_craft({
	output = "fsg:gen",
	recipe = { -- Changed from steelblock to diamondblock (Make it more expensive so folks can't use it as much)
		{"default:diamondblock", "default:diamondblock", "default:diamondblock"},
		{"default:diamondblock", "default:mese", "default:diamondblock"},
		{"default:diamondblock", "default:diamondblock", "default:diamondblock"},
	}
})
end