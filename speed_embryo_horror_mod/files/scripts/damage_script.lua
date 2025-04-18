-- Honestly I forgot what all of this does but in the end it stores all the damage you take  and gives it back to you on projectile damage
function damage_received( damage, message, entity_thats_responsible, is_fatal, projectile_thats_responsible )
    if projectile_thats_responsible ~= 0 then
        local player_id = GetUpdatedEntityID()
        local vsc_id = EntityGetFirstComponentIncludingDisabled( player_id, "VariableStorageComponent", "CURSED_DAMAGE_PERKS"  )
        local stored_dam = ComponentGetValue2( vsc_id, "value_float" )		
        EntityInflictDamage( player_id, stored_dam, "DAMAGE_MELEE", "Stored Damage", "NONE", 0, 0, player_id )
		ComponentSetValue2( vsc_id, "value_float", 0 )
    end
end

function damage_about_to_be_received( damage, x, y, entity_thats_responsible, critical_hit_chance )
    local player = GetUpdatedEntityID()
	if entity_thats_responsible == 0 then
		local vsc_id = EntityGetFirstComponentIncludingDisabled( player, "VariableStorageComponent", "CURSED_DAMAGE_PERKS"  )
		local adding = ComponentGetValue2( vsc_id, "value_float" )
		ComponentSetValue2( vsc_id, "value_float", damage + adding )
		return 0, critical_hit_chance
	end
	return damage, critical_hit_chance
end