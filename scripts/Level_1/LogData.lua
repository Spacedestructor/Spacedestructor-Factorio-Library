---Logs useful Debugging Data to "Spacedestructor/Library/"
---@param player_index integer|string|LuaPlayer
---@param Data table
---@param DataType string
function LogData(player_index, Data, DataType)
	local PlayerIndex
	if type(player_index) == "string" then
		PlayerIndex = game.players[player_index]
	elseif type(player_index) == "number" then
		PlayerIndex = player_index
	else
		---@diagnostic disable-next-line: undefined-field
		PlayerIndex = player_index.index
	end
	---@diagnostic disable-next-line: param-type-mismatch
	helpers.write_file("Spacedestructor/Library/" .. DataType .. ".log", serpent.block(Data), false, PlayerIndex)
end