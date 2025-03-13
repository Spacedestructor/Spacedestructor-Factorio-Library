---Returns the Middle Point between 2 Numbers.
---@param A number
---@param B number
---@return number
---@nodiscard
function MiddlePoint(A, B)
	return math.min(A, B) + ((math.abs(math.max(A, B) - math.min(A, B))) / 2)
end