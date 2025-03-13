---@diagnostic disable: assign-type-mismatch, missing-fields
data:extend({
	{
		type = "bool-setting",
		name = "SL-Debug",
		order = "0",
		hidden = false,
		setting_type = "runtime-per-user",
		default_value = false
	},
	{
		type = "bool-setting",
		name = "SL-CreateTimeStampDebug",
		order = "3",
		hidden = false,
		setting_type = "runtime-per-user",
		default_value = false
	},
	{
		type = "bool-setting",
		name = "SL-DictionaryToTableDebug",
		order = "4",
		hidden = false,
		setting_type = "runtime-per-user",
		default_value = false
	},
	{
		type = "bool-setting",
		name = "SL-EventIDToNameDebug",
		order = "5",
		hidden = false,
		setting_type = "runtime-per-user",
		default_value = false
	},
	{
		type = "bool-setting",
		name = "SL-FindRichTextDebug",
		order = "6",
		hidden = false,
		setting_type = "runtime-per-user",
		default_value = false
	},
	{
		type = "bool-setting",
		name = "SL-LogDataDebug",
		order = "7",
		hidden = false,
		setting_type = "runtime-per-user",
		default_value = false
	},
	{
		type = "bool-setting",
		name = "SL-TableToDictionaryDebug",
		order = "8",
		hidden = false,
		setting_type = "runtime-per-user",
		default_value = false
	},
	{
		type = "string-setting",
		name = "SRS-RocketSiloTrigger",
		order = "-1",
		hidden = false,
		setting_type = "runtime-per-user",
		default_value = "event",
		allowed_values = {"event", "tick"}
	}
})