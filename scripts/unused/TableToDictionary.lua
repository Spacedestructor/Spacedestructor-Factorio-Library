---@diagnostic disable: undefined-doc-name
---Turns Table in to Dictionary. All tables must be ipairs compatible.
---@param table table
---@param player_index integer|string|LuaPlayer
---@return dictionary
---@nodiscard
function TableToDictionary(table, player_index)
	local Dictionary = {}
	for key, value in ipairs(table) do
		Dictionary[tostring(key)] = value
	end
	if settings.get_player_settings(player_index)["SL-TableToDictionaryDebug"].value then
		game.print("Spacedestructor-Library, TableToDictionary.lua - Result: " .. serpent.block(Dictionary))
	end
	return Dictionary
end