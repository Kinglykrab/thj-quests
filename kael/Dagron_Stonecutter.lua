-- Kael Velious Armor - Monk
local quest_helper	= require('velious_quest_helper');
local KAEL_ARMOR	= quest_helper.KAEL_ARMOR;

local QUEST_ITEMS = {
	quest_helper:melee_helmet(KAEL_ARMOR.Leather_Cap,		25440),	-- Item: Golden Star Headband
	quest_helper:melee_chest(KAEL_ARMOR.Leather_Tunic,		25441),	-- Item: Golden Star Chest Wraps
	quest_helper:melee_arms(KAEL_ARMOR.Leather_Sleeves,		25442),	-- Item: Golden Star Arm Wraps
	quest_helper:melee_bracer(KAEL_ARMOR.Leather_Bracelet,	25443),	-- Item: Golden Star Wrist Wraps
	quest_helper:melee_gloves(KAEL_ARMOR.Leather_Gloves,	25444),	-- Item: Fist of the Golden Star
	quest_helper:melee_legs(KAEL_ARMOR.Leather_Leggings,	25445),	-- Item: Golden Star Pants
	quest_helper:melee_boots(KAEL_ARMOR.Leather_Boots,		25446)	-- Item: Golden Star Slippers
};

function event_say(e)
	if e.other:GetFaction(e.self) == 1 then -- Must be ally
		if e.message:findi("hail") then
			e.self:Say("Greetings to you. I seek one who has chosen the path of [" .. eq.say_link("I am a Monk",false,"monkhood") .. "]. What do you call yourself?");
		elseif e.message:findi("monk") then
			e.self:Say("Good. I had hoped you were one. As seeker of the way you are in constant training to push yourself to your physical and mental limits. It is an admirable quality and I wish to aid you. I will provide you with a [cap], a [tunic], [sleeves], [bracers], [gloves], [leggings] and [boots].");
		elseif e.message:findi("cap") then
			e.self:Say("I shall weave one of exceptional quality for you but you must gather the items first. I require an ancient leather cap and a set of three pieces of crushed coral.");
		elseif e.message:findi("tunic") then
			e.self:Say("You shall be an imposing force with this tunic. Solid as the unmoving mountains, it shall protect you. Once I have gained an ancient leather tunic and three flawless diamonds, the item is yours.");
		elseif e.message:findi("sleeves") then
			e.self:Say("As the mighty stone that parts the flow of water, so shall these sleeves divert harm against you. Bring me three flawed emeralds and a pair of ancient leather sleeves.");
		elseif e.message:findi("bracers") then
			e.self:Say("For a bracer I shall require an ancient leather bracelet and a set of three crushed flame emeralds. Do this and the reward shall be yours to keep.");
		elseif e.message:findi("gloves") then
			e.self:Say("Your hands are like the wind, everflowing and moving. Subtle one moment, then a howling wind raining blow upon blow to your foes. These gloves shall aid you. In order to complete them I require a pair of ancient leather gloves and three crushed topaz.");
		elseif e.message:findi("leggings") then
			e.self:Say("The leggings shall protect you, as the valley shelters the still pool within its center from the howling winds. Furnish a pair of ancient leather leggings and a set of three flawed sea sapphires for me and they are yours.");
		elseif e.message:findi("boots") then
			e.self:Say("Your feet are hard as any stone and as swift as a coiled serpent but even the swiftest feet require protection so I shall provide you with these. They should help. Acquire a pair of ancient tarnished boots and three crushed pieces of black marble.");
		end
	else
		e.self:Say("You must prove your dedication to Kael Drakkal and the Kromzek clan before I will speak to you.");
	end
end

function event_trade(e)
	quest_helper:quest_turn_in(e, 1, QUEST_ITEMS, quest_helper.kael_armor_success);
end
