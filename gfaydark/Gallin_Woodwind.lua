function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Greetings. friend! I am Gallin Woodwind of the Emerald Warriors. It is my charge to send forth Fier'Dal to [hunt for meat]. Kelethin's citizens must be nourished and this requires meat. Such is the circle of life.");
	elseif e.message:findi("hunt for meat") then
		e.self:Say("Good!!  We have enough young warriors hunting in our woods. Your duty shall be to take this pack to the ocean and seek out sharks. Fill the bag with shark meat and combine it. I shall reward you with a fine piercing weapon.");
		e.other:SummonItem(17953); -- Item: Pack for Shark
	end
end

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 12121}) then -- Item: Pack of Meat
		e.self:Say("Very good. This meat will supply our warriors with much strength. We have found the meat from sharks to be quite nourishing. Here, then, are your wages and your weapon. All of Kelethin appreciates your great deed.");
		e.other:Faction(326,40);	-- Faction: Emerald Warriors
		e.other:Faction(270,-4);	-- Faction: Indigo Brotherhood
		e.other:Faction(325,4);		-- Faction: Merchants of Felwithe
		e.other:Faction(276,4);		-- Faction: Kelethin Merchants
		e.other:SummonItem(eq.ChooseRandom(5026,5027,5028,5029,5030,5031,5032,5033,5034,5035,5036,5037,5082,6041,6042,6046,7032));
		e.other:QuestReward(e.self,{exp = 1000, copper = math.random(9), silver = math.random(9), gold = math.random(9)});
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
