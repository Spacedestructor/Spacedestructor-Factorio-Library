game.players[1].force.research_all_technologies()
for _, Technology in pairs(game.players[1].force.technologies) do
	if Technology.level < Technology.prototype.max_level then
		Technology.level = Technology.prototype.max_level
	end
end