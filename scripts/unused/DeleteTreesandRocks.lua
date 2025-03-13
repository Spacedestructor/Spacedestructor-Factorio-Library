--Editor Lua Snippet.
--Name: Delete Trees and Rocks.

local Entities = game.surfaces["nauvis"].find_entities()
for Key, Entity in pairs(Entities) do
	local T_Start, T_End = string.find(string.lower(Entity.name), "tree", 1, true)
	local R_Start, R_End = string.find(string.lower(Entity.name), "rock", 1, true)
	if T_Start ~= nil and T_End ~= nil or R_Start ~= nil and R_End ~= nil then
		local Name = Entity.name
		local Position = Entity.position
		local success = Entity.destroy()
		if success then
			log("Deleted " .. Name .. " from " .. serpent.block(Position) .. " on nauvis!")
		end
	end
end