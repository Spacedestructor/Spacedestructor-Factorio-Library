--[[
Rocket Silo:
A) Crafting Status:
1) "Preparing Rocket for Launch" (Active During Animation Status 1)
2) "Waiting to Launch Rocket" (Active During Animation Status 2-8)
3) "Launching Rocket" (Active During Animation Status 9-15)e

B) Animation Status:
1) "Building Rocket"
2) "Create Rocket"
3) "Lights Blinking Open"
4) "Doors Opening"
5) "Doors Opened"
6) "Rocket Rising" or if Rocket Destroyed "Lights Blinking Close"
7) "Arms Advance" or if Rocket Destroyed "Lights Blinking Close"
8) "Rocket Ready" or if Rocket Destroyed "Lights Blinking Close"
9) "Launch Starting"
10) "Launch Started"
11) "Engine Starting" or if Rocket Destroyed "Lights Blinking Close"
12) "Arms Retract" or if Rocket Destroyed "Lights Blinking Close"
13) "Rocket Flying" or if Rocket Destroyed "Lights Blinking Close"
14) "Lights Blinking Close"
15) "Doors Closing"
]]

---Registers Event Handlers Depending on a Setting that Keep track of the Rocket Silo Status.
---@param player_index any
function RocketSilo(player_index, RocketSiloData)
	local Setting = settings.get_player_settings(player_index)["SRS-RocketSiloTrigger"].value
	game.players[player_index].print("Setting Value: " .. Setting)
	if Setting == "event" then
		script.on_event(defines.events.on_rocket_launched, function(event)
		end)
	elseif Setting == "tick" then
	end
	if RocketSiloData ~= nil then
		game.print("Rocket Silo Animation Status: " .. RocketSiloData["Animation"] .. "Rocket Silo Crafting Status: " .. RocketSiloData["Crafting"])
	end
end