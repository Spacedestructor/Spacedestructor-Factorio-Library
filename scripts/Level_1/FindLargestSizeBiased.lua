---Finds the Largest Side.
---@param Containers table
---@return string|nil
---@nodiscard
local function FindLargestSizeBiased(Containers)
	local LargestSize = 0
	local LargestDirections = {}
	for i = 1, 2, 1 do
		for side, Direction in pairs(Containers) do
			if i == 1 then
				if table_size(Direction) >= LargestSize then
					LargestSize = table_size(Direction)
				end
			elseif i == 2 then
				if table_size(Direction) == LargestSize then
					LargestDirections[side] = true
				end
			end
		end
	end
	local Side = ""
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
	else
		return nil
	end
	return Side
end
return FindLargestSizeBiased