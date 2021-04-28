# fsg: Free stuff genrator: use junk to make usefull stuff

License: LGPL-2.1

## The big box:

Everything in there will be used as power to creat new items.
(make sure it not becomes empty or the process will fail and restart over again)

## Left top corner: 

Add stuff that will be cloned, the results will be placed in the right side
(make shore it not becomes full)

## Buttons and the textbox:

You can let other people contribute or use the generator, (press to cycle status)

but only add to burn or take from the results.

Write the players names (1 name at every line) then press save.

## Locked

Only you can add and take.

## Members

Averyone can add, you and members can take.

## Generally

Everyone can add and take.


## Other settings

Are in the settings.lua

Some settings are:

* What items can be made and what can not (valid and invalid)
* What items contribute to the process of making an item. (burn value)
* Super allow on some stuff that can seem to be to powerful.
* Allow anything to be burned? (Includes how much that item is worth if unrecognized)
* Allow all except that on the invalid list. (Can be used for those who are lazy and don't want to help contribute to the list of mods supported automatically)

## Application Program Interface (API)

Use the fsg namespace.

```lua
local fsg = rawget(_G, "fsg") or nil
if fsg ~= nil then
	-- API calls here!
end
```

Functions:

* `add_invalid(itemstring)` Adds the given itemstring to the invalid list, that means it can not be told to produce that item.
* `add_valid(itemstring)` Adds the given itemstring to the valid list, that means you can produce it. (Not needed if `fsg_allow_all` is `true`)
* `add_burnable(itemstring, burn_amount)` Adds the given itemstring to the burnable list with burn_amount, that is, this item will provide this burn_amount to the progress of an item when placed in the burn area.
* `is_invalid(itemstring)` Returns `true` if the item is invalid, `false` otherwise.
* `is_valid(itemstring)` Returns `true` if the item is valid, `false` otherwise.
* `is_burnable(itemstring)` Returns burn_amount if item is in the burnable list, 0 otherwise.

See example.lua for examples of using these calls.

## Mods/Games Supported

Added support for some mod items (not all) via the extended folder and in the settings.lua file (at line 102, subject to change).

* minetest_game
* technic
* drawers
* schemedit
* moreblocks
* laptop
* moreores
* airtanks

## Item Generator or Item Factory?

A Item Generator (fsg:gen) consumes "junk" items to produce other items.
(Depending the items to be burned up, it may be significantly faster than a Item Factory, but the Factory can run indefinitly)

Where as a Item Factory (fsg:gen2) simply requires a product and gets to work producing items.
(This also means an Item Factory doesn't have the big area for burning items, instead it goes at a constant rate)

## Upgrading a Generator to a Factory

1. Simply stick your Item Generator into the furnace with plenty of fuel for the furnace.
2. Wait 5 minutes till you get your Item Factory from the furnace.

## Downgrading a Factory to a Generator

There are 2 ways:

Crafting:

1. Simply stick your Item Factory into any slot on the crafting grid (9x9) and get your Item Generator back.

Furnace:

1. Stick your Item Factory back into the furnace to return it to a Item Generator.
(About 1 second is needed to "cook" it down)

