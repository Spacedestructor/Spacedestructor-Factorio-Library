---Takes in an Entity Prototype and outputs 2 tables of Statuses the Entity can have.
---@param Prototype string
---@return table, table
function StatusLookup(Prototype)
	local ID
	local String = {}
	return ID[Prototype], String[Prototype]
end