--Prepares Defines Tables for later Look up.
function PrepareDefines()
	--Prepares Events.

	local Dictionary = defines.events
	--log("Dictionary: " .. serpent.block(Dictionary))

	local _ = remote.call("SL", "setGlobals", "EventDictionary", Dictionary, "Spacedestructor-Library")
	--log("EventDictionary: " .. serpent.block(remote.call("SL", "getGlobals", "EventDictionary")))
	--log("Successfully Stored `EventDictionary` in storage")

	local List = {}
	for Name, ID in pairs(Dictionary) do
		List[tostring(ID)] = Name
	end
	local Events = {}
	for i = 1, table_size(List), 1 do
		Events[i] = List[tostring(i)]
	end
	--log("List: " .. serpent.block(List))
	--log("Events: " .. serpent.block(Events))

	local _ = remote.call("SL", "setGlobals", "EventTable", Events, "Spacedestructor-Library")
	assert(remote.call("SL", "getGlobals", "EventTable"), "Failed to store `EventTable` in storage.")
	--log("EventTae: .. serpent.block(remote.call("SL", "getGlobals", "EventTable")))
	--log("Successfully Stored `EventTable` in storage")


	--Prepares Entity Status.

	Dictionary = defines.entity_status
	--log("EtitytatusDictionary: " .. serpent.block(Dictionary))
	local _ = remote.call("SL", "setGlobals", "EntityStatusDictionary", Dictionary, "Spacedestructor-Library")
	assert(remote.call("SL", "getGlobals", "EntityStatusDictionary"), "Failed to store `EntityStatusDictionary` in storage")
	List = {}
	for Name, ID in pairs(Dictionary) do
		List[tostring(ID)] = Name
	end
	local Statuses = {}
	for i = 1, table_size(List), 1 do
		Statuses[i] = List[tostring(i)]
	end
	--log("EntityStatusTable: " .. serpent.block(Statuses))

	local _ = remote.call("SL", "setGlobals", "EntityStatusTable", Statuses, "Spacedestructor-Library")
	assert(remote.call("SL", "getGlobals", "EntityStatusTable"), "Failed to store `EntityStatusTable` in storage")
end