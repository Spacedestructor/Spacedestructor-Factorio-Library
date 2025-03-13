---Creates a Timestamp out of a Game Tick.
---@param tick integer
---@param player_index integer|string|LuaPlayer
---@return string MessageDateLong Long Timestamp Formating.
---@return string MessageDateShort Short Timestamp Formating.
function CreateTimeStamp(tick, player_index)
	local ticks, seconds, minutes, hours, days, weeks, months, years = tick, 0, 0, 0, 0, 0, 0, 0
	while ticks > 59 do
		seconds = seconds + 1; ticks = ticks - 60
	end
	while seconds > 59 do
		minutes = minutes + 1; seconds = seconds - 60
	end
	while minutes > 59 do
		hours = hours + 1; minutes = minutes - 60
	end
	while hours > 23 do
		days = days + 1; hours = hours - 24
	end
	while days > 6 do
		weeks = weeks + 1; days = days - 7
	end
	while weeks > 3 do
		months = months + 1; weeks = weeks - 4
	end
	while months > 11 do
		years = years + 1; months = months - 12
	end
	local MessageDateLong = ""
	local MessageDateShort = ""
	if years > 0 then
		MessageDateLong = tostring(years) .. " Years, " .. tostring(months) .. " Months, " .. tostring(weeks) .. " Weeks, " .. tostring(days) .. " Days, " .. tostring(hours) .. " Hours, " .. tostring(minutes) .. " Minutes, " .. tostring(seconds) .. " Seconds, " .. tostring(ticks) .. " Ticks."
		MessageDateShort = tostring(years) .. ":" .. tostring(months) .. ":" .. tostring(weeks) .. ":" .. tostring(days) .. ":" .. tostring(hours) .. ":" .. tostring(minutes) .. ":" .. tostring(seconds) .. ":" .. tostring(ticks)
	elseif months > 0 then
		MessageDateLong = tostring(months) .. " Months, " .. tostring(weeks) .. " Weeks, " .. tostring(days) .. " Days, " .. tostring(hours) .. " Hours, " .. tostring(minutes) .. " Minutes, " .. tostring(seconds) .. " Seconds, " .. tostring(ticks) .. " Ticks."
		MessageDateShort = tostring(months) .. ":" .. tostring(weeks) .. ":" .. tostring(days) .. ":" .. tostring(hours) .. ":" .. tostring(minutes) .. ":" .. tostring(seconds) .. ":" .. tostring(ticks)
	elseif weeks > 0 then
		MessageDateLong = tostring(weeks) .. " Weeks, " .. tostring(days) .. " Days, " .. tostring(hours) .. " Hours, " .. tostring(minutes) .. " Minutes, " .. tostring(seconds) .. " Seconds, " .. tostring(ticks) .. " Ticks."
		MessageDateShort = tostring(weeks) .. ":" .. tostring(days) .. ":" .. tostring(hours) .. ":" .. tostring(minutes) .. ":" .. tostring(seconds) .. ":" .. tostring(ticks)
	elseif days > 0 then
		MessageDateLong = tostring(days) .. " Days, " .. tostring(hours) .. " Hours, " .. tostring(minutes) .. " Minutes, " .. tostring(seconds) .. " Seconds, " .. tostring(ticks) .. " Ticks."
		MessageDateShort = tostring(days) .. ":" .. tostring(hours) .. ":" .. tostring(minutes) .. ":" .. tostring(seconds) .. ":" .. tostring(ticks)
	elseif hours > 0 then
		MessageDateLong = tostring(hours) .. " Hours, " .. tostring(minutes) .. " Minutes, " .. tostring(seconds) .. " Seconds, " .. tostring(ticks) .. " Ticks."
		MessageDateShort = tostring(hours) .. ":" .. tostring(minutes) .. ":" .. tostring(seconds) .. ":" .. tostring(ticks)
	elseif minutes > 0 then
		MessageDateLong = tostring(minutes) .. " Minutes, " .. tostring(seconds) .. " Seconds, " .. tostring(ticks) .. " Ticks."
		MessageDateShort = tostring(minutes) .. ":" .. tostring(seconds) .. ":" .. tostring(ticks)
	elseif seconds > 0 then
		MessageDateLong = tostring(seconds) .. " Seconds, " .. tostring(ticks) .. " Ticks."
		MessageDateShort = tostring(seconds) .. ":" .. tostring(ticks)
	else
		MessageDateLong = tostring(ticks) .. " Ticks."
		MessageDateShort = tostring(ticks)
	end
	if settings.get_player_settings(player_index)["SL-CreateTimeStampDebug"].value then
		game.print("[Spacedestructor-Library] CreateTimeStamp.lua - MessageDateShort: " .. MessageDateShort .. ", MessageDateLong: " .. MessageDateLong)
	end
	return MessageDateLong, MessageDateShort
end
