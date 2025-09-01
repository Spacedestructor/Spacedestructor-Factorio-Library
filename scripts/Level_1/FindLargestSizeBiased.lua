---Finds the Largest Side.
---@param Containers table
---@return string|nil
---@nodiscard
local function FindLargestSizeBiased(Containers)
	assert(Containers ~= nil and type(Containers) == "table" and table_size(Containers) > 0, "Containers is " .. serpent.block(Containers))
	--if Debug then
		--log("\nParameter Containers: " .. serpent.block(Containers))
	--end
	local LargestSize = 0
	local LargestDirections = {
		top = false,
		right = false,
		bottom = false,
		left = false
	}
	local Directions = {"top", "right", "bottom", "left"}
	for _, DirectionName in pairs(Directions) do
		if table_size(Containers[DirectionName]) > LargestSize then
			LargestSize = table_size(Containers[DirectionName])
		end
	end
	for _, DirectionName in pairs(Directions) do
		if table_size(Containers[DirectionName]) == LargestSize then
			LargestDirections[DirectionName] = true
			break
		end
	end
	--if Debug then
		--log("\nLargestDirections: " .. serpent.block(LargestDirections) .. "\nSize: " .. LargestSize)
	--end
	local Side = nil
	--Priotize Top Direction if it Equals to the Largest Size.
	if LargestDirections.top == true then
		Side = "top"
	--Priotize Right Direction if it Equals to the Largest Size but not Top Direction.
	elseif LargestDirections.right == true then
		Side = "right"
	--Priotize Bottom Direction if it Equals to the Largest Size but not Top or Right Direction.
	elseif LargestDirections.bottom == true then
		Side = "bottom"
	--Priotize Left Direction if it Equals to the Largest Size but not Top, Right or Bottom Direction.
	elseif LargestDirections.left == true then
		Side = "left"
	--This if No Direction Qualifies.
	end
	--if Debug then
		--log("\nReturning Side: " .. Side)
	--end
	return Side
end
return FindLargestSizeBiased