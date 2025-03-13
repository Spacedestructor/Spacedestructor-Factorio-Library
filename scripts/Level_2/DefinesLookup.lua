--[[
Looks up any Defines Table Stored in the Libraries storage.

`Reference` is the thing your looking for.

Returns `nil` if the Reference doesnt exist.

Will Error if any Parameter is Invalid.
]]
---@param Defines string
---@param Reference string|number
---@return number|string|nil
---@nodiscard
function DefinesLookup(Defines, Reference)
	if Defines == "events" then
		if type(Reference) == "string" then
			local Dictionary = remote.call("SL", "getGlobals", "EventDictionary")
			if Dictionary[Reference] ~= nil then
				return Dictionary[Reference]
			else
				return nil
			end
		elseif type(Reference) == "number" then
			local Table = remote.call("SL", "getGlobals", "EventTable")
			if Table[Reference] ~= nil then
				return Table[Reference]
			else
				return nil
			end
		else
			error("Invalid Parameter!", 2)
		end
	elseif Defines == "entity_status" then
		if type(Reference) == "string" then
			local Dictionary = remote.call("SL", "getGlobals", "EntityStatusDictionary")
			return Dictionary[Reference]
		elseif type(Reference) == "number" then
			local Table = remote.call("SL", "getGlobals", "EntityStatusTable")
			return Table[Reference]
		else
			error("Invalid Parameter!", 2)
		end
	else
		error("Invalid Parameter!", 2)
	end
end