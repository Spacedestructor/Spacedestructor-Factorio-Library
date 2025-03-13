---Finds Rich Text in  Messages.
---@param Message string
---@param player_index string|integer|LuaPlayer
---@return table|nil Results Returns up to 4 Strings.
---@nodiscard
function FindRichText(Message, player_index)
	local Results = {}
	local Position = 1
	while Position < string.len(Message) do
		local RichText_Start_A, RichText_Start_B = string.find(Message, "[", Position, true)
		local RichText_Prefix_A, RichText_Prefix_B, RichText_Prefix_Text, RichText_End_A, RichText_End_B
		if RichText_Start_A ~= nil and RichText_Start_B ~= nil then
			RichText_End_A, RichText_End_B = string.find(Message, "]", RichText_Start_B + 1, true)
			if RichText_End_A ~= nil and RichText_End_B ~= nil then
				if string.sub(Message, RichText_Start_B + 1, RichText_Start_B + 4) == "img=" then
					RichText_Prefix_A = RichText_Start_B + 1
					RichText_Prefix_B = RichText_Start_B + 4
					RichText_Prefix_Text = string.sub(Message, RichText_Prefix_A, RichText_Prefix_B)
					if RichText_End_A ~= nil and RichText_End_B ~= nil then
						if helpers.is_valid_sprite_path(string.sub(Message, RichText_Prefix_B + 1, RichText_End_A - 1)) then
							local RichText_ImgPath_A = RichText_Prefix_B + 1
							local RichText_ImgPath_B = RichText_End_A - 1
							local RichText_ImgPath_Text = string.sub(Message, RichText_ImgPath_A, RichText_ImgPath_B)
							table.insert(Results, #Results + 1, {
								Prefix = RichText_Prefix_Text,
								Path = RichText_ImgPath_Text,
							})
						else
							if settings.get_player_settings(player_index)["SL-FindRichTextDebug"].value then
								game.print("Unable to find valid Image Path in Rich Text: " .. string.sub(Message, RichText_Prefix_B + 1, RichText_End_A - 1))
							end
						end
					else
						break
					end
				elseif string.sub(Message, RichText_Start_B + 1, RichText_Start_B + 5) == "item=" then
					RichText_Prefix_A = RichText_Start_B + 1
					RichText_Prefix_B = RichText_Start_B + 5
					RichText_Prefix_Text = string.sub(Message, RichText_Prefix_A, RichText_Prefix_B)
					if prototypes.item[string.sub(Message, RichText_Prefix_B + 1, RichText_End_A - 1)] then
						local RichText_Item_A = RichText_Prefix_B + 1
						local RichText_Item_B = RichText_End_A - 1
						local RichText_Item_Text = string.sub(Message, RichText_Item_A, RichText_Item_B)
						table.insert(Results, #Results + 1, {
							Prefix = RichText_Prefix_Text,
							Item = RichText_Item_Text
						})
					else
					end
				elseif string.sub(Message, RichText_Start_B + 1, RichText_Start_B + 7) == "entity=" then
					RichText_Prefix_A = RichText_Start_B + 1
					RichText_Prefix_B = RichText_Start_B + 7
					RichText_Prefix_Text = string.sub(Message, RichText_Prefix_A, RichText_Prefix_B)
					if prototypes.entity[string.sub(Message, RichText_Prefix_B + 1, RichText_End_A - 1)] then
						local RichText_Entity_A = RichText_Prefix_B + 1
						local RichText_Entity_B = RichText_End_A - 1
						local RichText_Entity_Text = string.sub(Message, RichText_Entity_A, RichText_Entity_B)
						table.insert(Results, #Results + 1, {
							Prefix = RichText_Prefix_Text,
							Entity = RichText_Entity_Text
						})
					else
					end
				elseif string.sub(Message, RichText_Start_B + 1, RichText_Start_B + 11) == "technology=" then
					RichText_Prefix_A = RichText_Start_B + 1
					RichText_Prefix_B = RichText_Start_B + 11
					RichText_Prefix_Text = string.sub(Message, RichText_Prefix_A, RichText_Prefix_B)
					if prototypes.technology[string.sub(Message, RichText_Prefix_B + 1, RichText_End_A - 1)] then
						local RichText_Technology_A = RichText_Prefix_B + 1
						local RichText_Technology_B = RichText_End_A - 1
						local RichText_Technology_Text = string.sub(Message, RichText_Technology_A, RichText_Technology_B)
						table.insert(Results, #Results + 1, {
							Prefix = RichText_Prefix_Text,
							Technology = RichText_Technology_Text
						})
					else
					end
				elseif string.sub(Message, RichText_Start_B + 1, RichText_Start_B + 7) == "recipe=" then
					RichText_Prefix_A = RichText_Start_B + 1
					RichText_Prefix_B = RichText_Start_B + 7
					RichText_Prefix_Text = string.sub(Message, RichText_Prefix_A, RichText_Prefix_B)
					if prototypes.recipe[string.sub(Message, RichText_Prefix_B + 1, RichText_End_A - 1)] then
						local RichText_Recipe_A = RichText_Prefix_B + 1
						local RichText_Recipe_B = RichText_End_A - 1
						local RichText_Recipe_Text = string.sub(Message, RichText_Recipe_A, RichText_Recipe_B)
						table.insert(Results, #Results + 1, {
							Prefix = RichText_Prefix_Text,
							Recipe = RichText_Recipe_Text
						})
					else
					end
				elseif string.sub(Message, RichText_Start_B + 1, RichText_Start_B + 11) == "item-group=" then
					RichText_Prefix_A = RichText_Start_B + 1
					RichText_Prefix_B = RichText_Start_B + 11
					RichText_Prefix_Text = string.sub(Message, RichText_Prefix_A, RichText_Prefix_B)
					if prototypes.recipe[string.sub(Message, RichText_Prefix_B + 1, RichText_End_A - 1)] then
						local RichText_ItemGroup_A = RichText_Prefix_B + 1
						local RichText_ItemGroup_B = RichText_End_A - 1
						local RichText_ItemGroup_Text = string.sub(Message, RichText_ItemGroup_A, RichText_ItemGroup_B)
						table.insert(Results, #Results + 1, {
							Prefix = RichText_Prefix_Text,
							ItemGroup = RichText_ItemGroup_Text
						})
					else
					end
				elseif string.sub(Message, RichText_Start_B + 1, RichText_Start_B + 6) == "fluid=" then
					RichText_Prefix_A = RichText_Start_B + 1
					RichText_Prefix_B = RichText_Start_B + 6
					RichText_Prefix_Text = string.sub(Message, RichText_Prefix_A, RichText_Prefix_B)
					if prototypes.fluid[string.sub(Message, RichText_Prefix_B + 1, RichText_End_A - 1)] then
						local RichText_Fluid_A = RichText_Prefix_B + 1
						local RichText_Fluid_B = RichText_End_A - 1
						local RichText_Fluid_Text = string.sub(Message, RichText_Fluid_A, RichText_Fluid_B)
						table.insert(Results, #Results + 1, {
							Prefix = RichText_Prefix_Text,
							Fluid = RichText_Fluid_Text
						})
					else
					end
				elseif string.sub(Message, RichText_Start_B + 1, RichText_Start_B + 5) == "tile=" then
					RichText_Prefix_A = RichText_Start_B + 1
					RichText_Prefix_B = RichText_Start_B + 5
					RichText_Prefix_Text = string.sub(Message, RichText_Prefix_A, RichText_Prefix_B)
					if prototypes.tile[string.sub(Message, RichText_Prefix_B + 1, RichText_End_A - 1)] then
						local RichText_Tile_A = RichText_Prefix_B + 1
						local RichText_Tile_B = RichText_End_A - 1
						local RichText_Tile_Text = string.sub(Message, RichText_Tile_A, RichText_Tile_B)
						table.insert(Results, #Results + 1, {
							Prefix = RichText_Prefix_Text,
							Tile = RichText_Tile_Text
						})
					else
					end
				elseif string.sub(Message, RichText_Start_B + 1, RichText_Start_B + 15) == "virtual-signal=" then
					RichText_Prefix_A = RichText_Start_B + 1
					RichText_Prefix_B = RichText_Start_B + 15
					RichText_Prefix_Text = string.sub(Message, RichText_Prefix_A, RichText_Prefix_B)
					if prototypes.virtual_signal[string.sub(Message, RichText_Prefix_B + 1, RichText_End_A - 1)] then
						local RichText_VirtualSignal_A = RichText_Prefix_B + 1
						local RichText_VirtualSignal_B = RichText_End_A - 1
						local RichText_VirtualSignal_Text = string.sub(Message, RichText_VirtualSignal_A,
							RichText_VirtualSignal_B)
						table.insert(Results, #Results + 1, {
							Prefix = RichText_Prefix_Text,
							VirtualSignal = RichText_VirtualSignal_Text
						})
					else
					end
				elseif string.sub(Message, RichText_Start_B + 1, RichText_Start_B + 12) == "achievement=" then
					RichText_Prefix_A = RichText_Start_B + 1
					RichText_Prefix_B = RichText_Start_B + 12
					RichText_Prefix_Text = string.sub(Message, RichText_Prefix_A, RichText_Prefix_B)
					if prototypes.achievement[string.sub(Message, RichText_Prefix_B + 1, RichText_End_A - 1)] then
						local RichText_Achievement_A = RichText_Prefix_B + 1
						local RichText_Achievement_B = RichText_End_A - 1
						local RichText_Achievement_Text = string.sub(Message, RichText_Achievement_A,
							RichText_Achievement_B)
						table.insert(Results, #Results + 1, {
							Prefix = RichText_Prefix_Text,
							Achievement = RichText_Achievement_Text
						})
					else
					end
				elseif string.sub(Message, RichText_Start_B + 1, RichText_Start_B + 4) == "gps=" then
					RichText_Prefix_A = RichText_Start_B + 1
					RichText_Prefix_B = RichText_Start_B + 4
					RichText_Prefix_Text = string.sub(Message, RichText_Prefix_A, RichText_Prefix_B)
					if RichText_End_A ~= nil and RichText_End_B ~= nil then
						local RichText_Coordinate_Seperator_A, RichText_Coordinate_Seperator_B = string.find(Message, ",",
							RichText_Prefix_B + 1)
						if RichText_Coordinate_Seperator_A ~= nil and RichText_Coordinate_Seperator_B ~= nil then
							local RichText_Coordinate_X_A = RichText_Prefix_B + 1
							local RichText_Coordinate_X_B = RichText_Coordinate_Seperator_A - 1
							local RichText_Coordinate_X_Text = string.sub(Message, RichText_Coordinate_X_A,
								RichText_Coordinate_X_B)
							local RichText_Surface_Seperator_A, RichText_Surface_Seperator_B = string.find(Message, ",",
								RichText_Coordinate_Seperator_B + 1)
							local RichText_Coordinate_Y_A, RichText_Coordinate_Y_B, RichText_Coordinate_Y_Text
							if RichText_Surface_Seperator_A ~= nil and RichText_Surface_Seperator_B ~= nil then
								RichText_Coordinate_Y_A = RichText_Coordinate_Seperator_B + 1
								RichText_Coordinate_Y_B = RichText_Surface_Seperator_A - 1
								RichText_Coordinate_Y_Text = string.sub(Message, RichText_Coordinate_Y_A,
									RichText_Coordinate_Y_B)
								local RichText_Surface_A = RichText_Surface_Seperator_B + 1
								local RichText_Surface_B = RichText_End_A - 1
								local RichText_Surface_Text = string.sub(Message, RichText_Surface_A, RichText_Surface_B)
								table.insert(Results, #Results + 1, {
									Prefix = RichText_Prefix_Text,
									Coordinate_X = RichText_Coordinate_X_Text,
									Coordinate_Y = RichText_Coordinate_Y_Text,
									Surface = RichText_Surface_Text
								})
							else
								RichText_Coordinate_Y_A = RichText_Coordinate_Seperator_B + 1
								RichText_Coordinate_Y_B = RichText_End_A - 1
								table.insert(Results, #Results + 1, {
									Prefix = string.sub(Message, RichText_Prefix_A, RichText_Prefix_B),
									Coordinate_X = string.sub(Message, RichText_Coordinate_X_A, RichText_Coordinate_X_B),
									Coordinate_Y = string.sub(Message, RichText_Coordinate_Y_A, RichText_Coordinate_Y_B)
								})
							end
						else
						end
					end
				elseif string.sub(Message, RichText_Start_B + 1, RichText_Start_B + 13) == "special-item=" then
					RichText_Prefix_A = RichText_Start_B + 1
					RichText_Prefix_B = RichText_Start_B + 13
					RichText_Prefix_Text = string.sub(Message, RichText_Prefix_A, RichText_Prefix_B)
					if helpers.json_to_table(helpers.decode_string(string.sub(Message, RichText_Prefix_B + 2, RichText_End_A - 1))).blueprint ~= nil or helpers.json_to_table(helpers.decode_string(string.sub(Message, RichText_Prefix_B + 2, RichText_End_A - 1))).deconstruction_planner ~= nil or helpers.json_to_table(helpers.decode_string(string.sub(Message, RichText_Prefix_B + 2, RichText_End_A - 1))).upgrade_planner ~= nil then
						local RichText_Blueprint_A = RichText_Prefix_B + 2
						local RichText_Blueprint_B = RichText_End_A - 1
						local RichText_Blueprint_Text = string.sub(Message, RichText_Blueprint_A, RichText_Blueprint_B)
						local RichText_Blueprint_Version = string.sub(Message, RichText_Prefix_B + 1,
							RichText_Prefix_B + 1)
						local RichText_Blueprint_Type
						if helpers.json_to_table(helpers.decode_string(string.sub(Message, RichText_Prefix_B + 2, RichText_End_A - 1))).blueprint ~= nil then
							RichText_Blueprint_Type = helpers.json_to_table(helpers.decode_string(string.sub(Message,
								RichText_Prefix_B + 2, RichText_End_A - 1))).blueprint.item
						elseif helpers.json_to_table(helpers.decode_string(string.sub(Message, RichText_Prefix_B + 2, RichText_End_A - 1))).deconstruction_planner ~= nil then
							RichText_Blueprint_Type = helpers.json_to_table(helpers.decode_string(string.sub(Message,
								RichText_Prefix_B + 2, RichText_End_A - 1))).deconstruction_planner.item
						elseif helpers.json_to_table(helpers.decode_string(string.sub(Message, RichText_Prefix_B + 2, RichText_End_A - 1))).upgrade_planner ~= nil then
							RichText_Blueprint_Type = helpers.json_to_table(helpers.decode_string(string.sub(Message,
								RichText_Prefix_B + 2, RichText_End_A - 1))).upgrade_planner.item
						end
						table.insert(Results, #Results + 1, {
							Prefix = RichText_Prefix_Text,
							String = RichText_Blueprint_Text,
							Version = RichText_Blueprint_Version,
							Type = RichText_Blueprint_Type
						})
					else
					end
				elseif string.sub(Message, RichText_Start_B + 1, RichText_Start_B + 6) == "armor=" then
					RichText_Prefix_A = RichText_Start_B + 1
					RichText_Prefix_B = RichText_Start_B + 6
					RichText_Prefix_Text = string.sub(Message, RichText_Prefix_A, RichText_Prefix_B)
					if game.get_player(string.sub(Message, RichText_Prefix_B + 1, RichText_End_A - 1)) then
						local RichText_Armor_A = RichText_Prefix_B + 1
						local RichText_Armor_B = RichText_End_A - 1
						local RichText_Armor_Text = string.sub(Message, RichText_Armor_A, RichText_Armor_B)
						table.insert(Results, #Results + 1, {
							Prefix = RichText_Prefix_Text,
							Player = RichText_Armor_Text
						})
					else
					end
				elseif string.sub(Message, RichText_Start_B + 1, RichText_Start_B + 6) == "train=" then
					RichText_Prefix_A = RichText_Start_B + 1
					RichText_Prefix_B = RichText_Start_B + 6
					RichText_Prefix_Text = string.sub(Message, RichText_Prefix_A, RichText_Prefix_B)
					local RichText_train_A = RichText_Prefix_B + 1
					local RichText_Train_B = RichText_End_A - 1
					local RichText_Train_Text = game.get_train_by_id(tonumber(string.sub(Message, RichText_train_A,
						RichText_Train_B))).id
					if RichText_Train_Text ~= nil then
						RichText_Train_Text = tostring(RichText_Train_Text)
						table.insert(Results, #Results + 1, {
							Prefix = RichText_Prefix_Text,
							Train = RichText_Train_Text
						})
					else
						RichText_Train_Text = tostring(RichText_Train_Text)
					end
				elseif string.sub(Message, RichText_Start_B + 1, RichText_Start_B + 11) == "train-stop=" then
					RichText_Prefix_A = RichText_Start_B + 1
					RichText_Prefix_B = RichText_Start_B + 11
					RichText_Prefix_Text = string.sub(Message, RichText_Prefix_A, RichText_Prefix_B)
					local RichText_TrainStop_A = RichText_Prefix_B + 1
					local RichText_TrainStop_B = RichText_End_A - 1
					local RichText_TrainStop_Text
					for _, entity in pairs(game.get_train_stops()) do
						if entity.unit_number == tonumber(string.sub(Message, RichText_TrainStop_A, RichText_TrainStop_B)) then
							RichText_TrainStop_Text = tostring(entity.unit_number)
							break
						end
					end
					if RichText_TrainStop_A ~= nil and RichText_TrainStop_B ~= nil and RichText_TrainStop_Text ~= nil then
						table.insert(Results, #Results + 1, {
							Prefix = RichText_Prefix_Text,
							TrainStop = RichText_TrainStop_Text
						})
					else
					end
				elseif string.sub(Message, RichText_Start_B + 1, RichText_Start_B + 8) == "tooltip=" then
					RichText_Prefix_A = RichText_Start_B + 1
					RichText_Prefix_B = RichText_Start_B + 8
					RichText_Prefix_Text = string.sub(Message, RichText_Prefix_A, RichText_Prefix_B)
					local RichText_Tooltip_Seperator_A, RichText_Tooltip_Seperator_B = string.find(Message, ",",
						RichText_Prefix_B + 1, true)
					local RichText_Tooltip_Text_A = RichText_Prefix_B + 1
					local RichText_Tooltip_Text_B = RichText_Tooltip_Seperator_A - 1
					local RichText_Tooltip_Text_Text = string.sub(Message, RichText_Tooltip_Text_A, RichText_Tooltip_Text_B)
					local RichText_Tooltip_Locale_A = RichText_Tooltip_Seperator_B + 1
					local RichText_Tooltip_Locale_B = RichText_End_A - 1
					local RichText_Tooltip_Locale_Text = string.sub(Message, RichText_Tooltip_Locale_A,
						RichText_Tooltip_Locale_B)
					table.insert(Results, #Results + 1, {
						Prefix = RichText_Prefix_Text,
						Text = RichText_Tooltip_Text_Text,
						Locale = RichText_Tooltip_Locale_Text
					})
				else
					break
				end
				Position = RichText_End_B
			else
				Position = RichText_Start_B
			end
		else
			if Position < string.len(Message) then
				Position = Position + 1
			end
		end
	end
	if settings.get_player_settings(player_index)["SL-FindRichTextDebug"].value then
		game.print("Result Count: " .. tostring(#Results))
	end
	return Results
end
--[[
		Leaving this here commented out because i dont understand Regex enough to know why it sometimes breaks.
		I would Rather use Regex as a smart solution if possible then the current dumb solution.
			local RichText = false
			if string.find(Message, "img=", RichText_Start_B, true) then
				RichText_Prefix_A, RichText_Prefix_B = string.find(Message, "img=", RichText_Start_B, true)
				if RichText_Prefix_A ~= nil and RichText_Prefix_B ~= nil then
					RichText_4_A, RichText_4_B = string.find(Message, "]", RichText_Start_A, true)--If img start is found, searches for img Rich Text ending with Plain Search.
					if RichText_4_A ~= nil and RichText_4_B ~= nil then
						RichText_3_A = game.is_valid_sprite_path(string.sub(Message, RichText_Prefix_B + 1, RichText_4_A - 1))--Validates sprite path.
						if RichText_3_A then
							RichText = true
							if RichText then
								table.insert(Results, #Results + 1, {
									Start = string.sub(Message, RichText_Start_A, RichText_Start_B),
									Prefix = string.sub(Message, RichText_Prefix_A, RichText_Prefix_B),
									Path = string.sub(Message, RichText_Prefix_B + 1, RichText_4_A - 1),
									End = string.sub(Message, RichText_End_A, RichText_End_B)
								})
								Position = RichText_4_B
							end
						end
					end
				end
			elseif string.find(Message, "gps=", RichText_Start_B, true) then
				RichText_Prefix_A, RichText_Prefix_B = string.find(Message, "gps=", RichText_Start_B, true)
				if RichText_Prefix_A ~= nil and RichText_Prefix_B ~= nil then
					RichText_3_A, RichText_3_B = string.find(Message, "[%-]*[%d]+[%.%d+]*", RichText_Prefix_B, false)
					if RichText_3_A ~= nil and RichText_3_B ~= nil then
						RichText_4_A, RichText_4_B = string.find(Message, "[%-]*[%d]+[%.%d+]*", RichText_3_B + 1, false)
						if RichText_4_A ~= nil and RichText_4_B ~= nil then
							RichText_5_A, RichText_5_B = string.find(Message, '[%"]?[%a]+[%"]?', RichText_4_B, false)
							if RichText_5_A ~= nil and RichText_5_B ~= nil then
								RichText_5_A = RichText_5_A + 1
								RichText_5_B = RichText_5_B - 1
							end
							RichText_End_A, RichText_End_B = string.find(Message, "]", RichText_5_B, true)
							if RichText_End_A ~= nil and RichText_End_B then
								RichText = true
								if RichText then
									if RichText_5_A ~= nil and RichText_5_B ~= nil then
										table.insert(Results, #Results + 1, {
											Start = string.sub(Message, RichText_Start_A, RichText_Start_B),
											Prefix = string.sub(Message, RichText_Prefix_A, RichText_Prefix_B),
											X = string.sub(Message, RichText_3_A, RichText_3_B),
											Y = string.sub(Message, RichText_4_A, RichText_4_B),
											Surface = string.sub(Message, RichText_5_A, RichText_5_B),
											End = string.sub(Message, RichText_End_A, RichText_End_B)
										})
									else
										table.insert(Results, #Results + 1, {
											Start = string.sub(Message, RichText_Start_A, RichText_Start_B),
											Prefix = string.sub(Message, RichText_Prefix_A, RichText_Prefix_B),
											X = string.sub(Message, RichText_3_A, RichText_3_B),
											Y = string.sub(Message, RichText_4_A, RichText_4_B),
											End = string.sub(Message, RichText_End_A, RichText_End_B)
										})
									end
									Position = RichText_End_B
								end
							end
						end
					end
				end
			end
		else
			break
		end
	end
	if RichText and settings.get_player_settings(player_index)["SL-FindRichTextDebug"].value then
		game.print(serpent.block(Results))
		return Results
	else
		if settings.get_player_settings(player_index)["SL-FindRichTextDebug"].value then
			game.print("Results: " .. tostring(table_size(Results)))
		end
		return false
	end
]]