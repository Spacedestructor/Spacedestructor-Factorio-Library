--[[
Note: Floating Point Errors, dont use "greater then", "less then" etc. and calculate difference of two numbers against which we compare to avoid bugs caused by floating Point Errors.
	Example:

		local function are_doubles_equal(a, b, epsilon)
    		epsilon = epsilon or 1e-4  -- Default epsilon value
    		return math.abs(a - b) < epsilon
		end

TODO:
ChatHistory:
Whisper Text appears in wrong location. (fix needs testing)
make rich text clickable in history. (is this doable?) Currently Not Possible! Create Custom Implementation instead. CURRENT
Consider adding Group Chats. (Faction, Surface, Permission Group or Custom)
Fix Looping over Gui Tags. CURRENT
Implement Rich Text History, this will let the Player select it directly rather then cycling through it. CURRENT

Sample Text:
ChatHistory:
Rich Text Test [img=item.iron-plate][img=quantity-time][img=utility/played_green][item=iron-plate][entity=small-biter][technology=logistics][recipe=basic-oil-processing][item-group=combat][fluid=water][tile=concrete][virtual-signal=signal-everything][achievement=lazy-bastard][gps=-10.3,5.7,nauvis][special-item=0eNqN092KwjAQBeB3mesI9r/Jq4gsVQcdaNOSRNlS8u6mLYiwLJzLSWa+EA6z0KV/8uTEBjILyXW0nsxpIS932/XrWZgnJkMSeCBFthvWynXSU1Qk9sa/ZLJ4VsQ2SBDe57di/rHP4cIuNXwmfUiz90c4bISiafRparTrU0k6VIpmMlWyb+L4ul/lUf0hc5gsULKAyQwlS5SExQoV4W/XqAhn06Big4otKmpU1HAycDTZETb/CSet0bZo5msvFb3Y+b2hzcpG501b6qLWdYxvX4M+ew==][armor=Spacedestructor][train=3][train-stop=25][tooltip=Test,item-name.iron-plate]
]]

--Percentage: Current / Total * 100 (each additional 0 adds a digit after the decimal point but this is factorio so we dont get to use decimal numbers.)

--Note: Commands starting with __Spacedestructor-Library__ will run in the context of this Mod´s storage.

--For Debugging Purposes with GVV

Debug = false
if script.active_mods["gvv"] then require("__gvv__.gvv")(); Debug = true end
if script.active_mods["0-event-trace"] then Debug = true end
if __DebugAdapter ~= nil then Debug = true end
log('"Debug Mode: "' .. tostring(Debug))

PrintSettings = { color = { r = 255, g = 255, b = 255, a = 255 }, sound = defines.print_sound.never, skip = defines.print_skip.never, game_state = false }

--Our Starting Items for Debugging purposes.
--StartingItems = require("scripts.Level_1.Debug")
--script.on_event(defines.events.on_player_created,function(Event) StartingItems(Event, {}) end)

--Factorio native Libraries

Util = require("util")
CompareTable = Util.table.compare

--Level 1 Functions

require("scripts.Level_1.PrepareDefines")

require("scripts.Level_1.Interfaces")

require("scripts.Level_1.CreateGui")

require("scripts.Level_1.FindLargestSizeBiased")

--Level 2 Functions

require("scripts.Level_2.StatusLookup")

--Event Handlers

--Filling this out later once Event Handlers are fixed to stop writing over each other.
--Instead they will call upon the same function with the same Handler which contains the code of all variants.

--New Game

script.on_init(function()
	---@diagnostic disable-next-line: undefined-global
	PrepareDefines()
	local success = remote.call("SL", "setGlobals", "ReportDisclaimer", "If your not a Developer, report this to the Mod that was Calling this Function.", "Spacedestructor-Library")
	if success then
		--log("Successfully Stored `ReportDisclaimer` in storage")
	else
		error("Failed to store `ReportDisclaimer` in storage!", 1)
	end
end)

--Loaded Game

script.on_load(function()
	--Not sure on the specifics but apparently i need to e init this on every load?

	local success = remote.call("SL", "setGlobals", "ReportDisclaimer", "If your not a Developer, report this to the Mod that was Calling this Function.", "Spacedestructor-Library")
	if success then
		--log("Successfully Stored `ReportDisclaimer` in storage")
	else
		error("Failed to store `ReportDisclaimer` in storage!", 1)
	end
end)