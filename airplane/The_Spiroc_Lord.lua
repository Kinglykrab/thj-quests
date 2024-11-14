function event_death_complete(e)
	local instance_id = eq.get_zone_instance_id() or 0;
	local airplane_sirran_status = tonumber(eq.get_data("airplane-sirran-" .. instance_id)) or 0;

	if not (eq.get_entity_list():IsMobSpawnedByNpcTypeID(71009) or eq.get_entity_list():IsMobSpawnedByNpcTypeID(71020) or eq.get_entity_list():IsMobSpawnedByNpcTypeID(71022)) then
		eq.set_data("airplane-sirran-" .. instance_id, "5", tostring(eq.seconds("24h")));
		eq.unique_spawn(71058,0,0,955,-570,466,390); -- NPC: Sirran_the_Lunatic
	end

	eq.signal(71013, 1); -- The_Spiroc_Guardian
end
