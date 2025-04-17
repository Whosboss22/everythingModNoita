dofile_once("data/scripts/lib/utilities.lua")

--[[ EXAMPLE
{
    id          = "ID",
	name 		= "TRUE_NAME",
	description = "TRUE_DESC",
	sprite 		= "PATH_TO_SPRITE",
	type 		= ACTION_TYPE,
	spawn_level = "SPAWN_LEVELS",
	spawn_probability = "SPAWN_PROBABILITIES",
	price = PRICE,
	mana = MANA,
	action = function()
		--PUT CODE HERE
	end,
}
]]--

local actions_enhanced = {
    {
        id          = "MAGNET_SHOT_ATTRACT",
        name 		= "Magnet Shot (attract)",
        description = "Gravitates towards other magnetic projectiles",
        sprite 		= "mods/speed_embryo_horror_mod/files/cards_gfx/magnet_shot_attract.xml",
        type 		= ACTION_TYPE_MODIFIER,
        spawn_level = "0,1,2,3,4,5",
        spawn_probability = "0.3,0.8,0.8,0.8,0.8,0.8",
        price = 50,
        mana = 10,
        action = function()
            c.extra_entities = c.extra_entities .. "mods/everythingUP/files/modifiers/magnet_shot_attract.xml,"
		    c.fire_rate_wait = c.fire_rate_wait + 2
		
		    draw_actions( 1, true )
        end,
    }
}

--!!!DONT EDIT THIS STUFF BELOW!!!
if not actions then return actions_enhanced end
for _, value in ipairs(actions_enhanced) do
    --inserting action
    local action = {
        id          = actions_enhanced.id,
        name 		= "$action_" .. value.id,
        description = "$actiondesc_" .. value.id,
        sprite 		= value.sprite,
        sprite_unidentified = "",
        type 		= value.type,
        spawn_level = value.spawn_level,
        spawn_probability = value.spawn_probability,
        price = value.price,
        mana = value.mana,
        action = value.action,
    }
    table.insert(actions, action)
end