--[[
require("scripts.Level_1.LogData")
--Logs all Styles.

LogData(1, remote.call("SL", "getGlobals", "Styles"), "Styles")

--Logs all Events.

LogData(1, remote.call("SL", "getGlobals", "Events"), "Events")

require("scripts.FindRichText")

require("scripts.CreateTimeStamp")

require("scripts.TableToDictionary")

require("scripts.DictionaryToTable")

require("scripts.MiddlePoint")

success = remote.call("SL", "setGlobals", "NewPlayer", NewPlayerEvent, "Spacedestructor-Library")
if success then
	log("Successfully Registered `NewPlayer` Event as: " .. tostring(NewPlayerEvent))
else
	error("Failed to Register `NewPlayer` Event!", 1)
end
success = remote.call("SL", "setGlobals", "ReturningPlayer", ReturningPlayerEvent, "Spacedestructor-Library")
if success then
	log("Successfully Registered `ReturningPlayer` Event as: " .. tostring(ReturningPlayerEvent))
else
	error("Failed to Register `ReturningPlayer` Event!", 1)
end
log("Direct Access storage `Events`: " .. serpent.block(storage["Events"]))
log("Remote Call storage `Events`: " .. serpent.block(remote.call("SL", "getGlobals", "Events")))
Testing for success here for some reason yields the wrong status at times.
Needs further testing to be able to validate if a table matches expectations.

if success then
	log("Successfully updated `Events` in storage")
else
	error("Failed to update `Events` in storage!", 1)
end
Allows us to tell the difference between any future joiners first time or not despite the join event triggering every time.
The only thing we should do in the Player Created event is registering our own New Player event and the asociated event handler.
Everything else can go in our own Events instead.

script.on_event(NewPlayerEvent, function(Event)
	log("Spacedestructor-Library triggered event " .. remote.call("SL", "getGlobals", "Events")[tostring(Event.name+1)] .. " for " .. game.players[Event.player_index].name)
end)
]]