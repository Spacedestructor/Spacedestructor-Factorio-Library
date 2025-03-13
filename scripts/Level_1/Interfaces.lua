remote.add_interface("SL", {
	---@param Name string
	---@param Data any
	---@param ModName string
	---@return any
	---@nodiscard
	---Sets a new storage in the scope of this Library. Returns true if successful, otherwise returns false. Wont edit Existing globals.
	---
	---See Comments for "deleteGlobals" for information on the "ModName" variable.
	setGlobals = function(Name, Data, ModName)
		--log("type(Name): " .. type(Name) .. " type(ModName): " .. type(ModName))
		if type(Name) == "string" and type(ModName) == "string" then
			--log("storage[Name]: " .. serpent.block(storage[Name]))
			if storage[Name] == nil then
				storage[Name] = { data = Data, mod_name = ModName }
				--log("storage[Name]: " .. serpent.block(storage[Name]))
				if storage[Name].mod_name == ModName or storage[Name].mod_name == nil then
					--log("type(storage[Name].data): " .. type(storage[Name].data))
					if type(storage[Name].data) == "string" or type(storage[Name].data) == "number" then
						--log("storage[Name].data == Data: " .. storage[Name].data == Data)
						if storage[Name].data == Data then
							return true
						else
							return false
						end
					elseif type(storage[Name].data) == "table" then
						for key, value in pairs(storage[Name].data) do
							if Data[key] ~= value then
								return false
							end
						end
						--log("Returning true")
						return true
					else
						log("Unknown type " .. type(storage[Name].data))
						return false
					end
				else
					return false
				end
			else
				return true
			end
		else
			return false
		end
	end,
	---If Successful returns a storage of thes Library, otherwise returns nil.
	---@param Name string
	---@return any
	---@nodiscard
	getGlobals = function(Name)
		if type(Name) == "string" then
			if storage[Name] == nil then
				return nil
			else
				return storage[Name].data
			end
		else
			return nil
		end
	end,
	---@param Name string
	---@param ModName string
	---@return boolean
	---@nodiscard
	---Deletes a storage in the scope of this Library.
	---
	---Returns true if successful, otherwise returns false.
	---
	---Obviously this will only let you delete Globals that your own Mod "owns".
	---
	---currently this is determined by the provided name and thus can be cheated easy if you want to cause harm.
	---
	---The system will be swaped to dynamically determining which Mod calls this Interface should further testing prove this possible.
	deleteGlobals = function(Name, ModName)
		if type(Name) == "string" and type(ModName) == "string" and ModName == storage[Name].mod_name then
			storage[Name] = nil
			if storage[Name] == nil then
				return true
			else
				return false
			end
		else
			return false
		end
	end,
	---Returns a List of all contents in storage of this Library, i will be impressed if anyone manages to break this function but please dont consider it a challenge.
	---@return table
	---@nodiscard
	listGlobals = function()
		return storage
	end
})