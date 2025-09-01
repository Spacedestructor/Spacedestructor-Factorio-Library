---Will get Player 1, enabled cheat mode, attempt to get Player Character and if true attempt to insert Starting Items and set the hotbar slots to them as well.
local function InsertStartingItems()
	local Items = storage.StartingItems
	log("Items: " .. serpent.block(Items))
	assert(Items ~= nil and type(Items) == "table" and table_size(Items) > 0, "Items is an invalid table.")
	local Player = game.players[1]
	Player.cheat_mode = true
	local Character = Player.character
	if Character then
		local Inventory = Player.get_main_inventory()
		if Inventory ~= nil then
			local Slot = 1
			for _, value in pairs(Items) do
				if value ~= nil and value.name ~= nil and value.count ~= nil then
					if Inventory.can_insert(value) then
						Inventory.insert(value)
						local ItemStack = Inventory.find_item_stack(value.name)
						Player.set_quick_bar_slot(Slot, ItemStack)
					end
					Slot = Slot + 1
				else
					error('Entry "' .. serpent.block(value) .. '" is invalid!')
				end
			end
			script.on_event(defines.events.on_tick, nil)
		end
	end
end
---If "StartingItems" was run at tick 0 this will check once per tick if we have moved past tick 0 and if true call "InsertStartingItems".
---
---Event cant be anything that provides a "tick" parameter.
---@param Event EventData
local function DelayedStartingItems(Event)
	---@diagnostic disable-next-line: undefined-field
	assert(Event ~= nil and Event.tick ~= nil, "Event is undefined or invalid.")
	---@diagnostic disable-next-line: undefined-field
	if Event.tick > 0 then
		InsertStartingItems()
	end
end
---Checks If we have moved on past the load/init tick, if true calls "InsertStartingItems" otherwise calls "DelayedStartingItems".
---
---Event must be either Player created or cutscene end for this to function as intended.
---@param Event defines.events
---@param Items table
local function StartingItems(Event, Items)
	assert(Event, "Event undefined.")
	assert(Items ~= nil and type(Items) == "table" and table_size(Items) > 0, "Items is an invalid table.")
	log("Event: " .. serpent.block(Event))
	if Debug == true then
		---@diagnostic disable-next-line: undefined-field
		if Event.tick < 1 then
			storage.StartingItems = Items
			script.on_event(defines.events.on_tick, function(event) DelayedStartingItems(event) end)
		else
			InsertStartingItems()
		end
	end
end

return StartingItems