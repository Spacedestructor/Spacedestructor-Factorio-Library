---@diagnostic disable: undefined-doc-name
---Turns Dictionary in to Table. Works best with Dictionaries defined by TableToDictionary.
---@param dictionary dictionary
---@param player_index integer|string|LuaPlayer
---@return table table
---@nodiscard
function DictionaryToTable(dictionary, player_index)
	local table = {}
	for i = 1, table_size(dictionary), 1 do
		table[i] = dictionary[tostring(i)]
	end
	if settings.get_player_settings(player_index)["SL-DictionaryToTableDebug"].value then
		game.print("Spacedestructor-Library, DictionaryToTable.lua - Result: " .. serpent.block(table))
	end
	return table
end