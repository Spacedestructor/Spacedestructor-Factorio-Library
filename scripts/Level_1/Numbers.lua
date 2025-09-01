---Lists all Number types and there Limits, Code comment explains.
---
---float is a "single-precision floating point". (double-precision in lua, converts to single-precision in the Engine)
---
---double is a "double-precision floating-point". (default for floats, wont convert)
---
--int is a "32-bit signed integer". (floors to a double)
---
---uint is a "32-bit unsigned integer". (floors to a double)
---
---uint8 is a "8-bit unsigned integer". (floors to a double)
---
---uint16 is a "16-bit unsigned integer". (floors to a double)
---
---uint64 is a "64-bit unsigned integer". (floors to double)
---
---Doesnt have the type "number" because its considered a wildcard that lets you choose between any of the types this function returns.
---@return table
---@nodiscard
local function Numbers()
	return {
		float = {
			min = 0,
			max = 3.4028235e+38
		},
		double = {
			min = 0,
			max = 9.00719925e+15
		},
		int = {
			min = -2147483648,
			max = 2147483647
		},
		int8 = {
			min = -128,
			max = 127
		},
		uint = {
			min = 0,
			max = 4294967295
		},
		uint8 = {
			min = 0,
			max = 255
		},
		uint16 = {
			min = 0,
			max = 65535
		},
		uint64 = {
			min = 0,
			max = 18446744073709551615
		}
	}
end
return Numbers