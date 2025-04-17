table.insert( actions, --MAGNET_SHOT_ATTRACT
{
	id          = "MAGNET_SHOT_ATTRACT",
	name 		= "$action_magnet_shot_attract",
	description = "$actiondesc_magnet_shot_attract",
	sprite 		= "mods/speed_embryo_horror_mod/files/cards_gfx/magnet_shot_attract.xml,",
	sprite_unidentified = "",
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "0,1,2,3,4,5",
	spawn_probability                 = "0.3,0.8,0.8,0.8,0.8,0.8",
	price = 50,
	mana = 10,
	action 		= function()
		c.extra_entities = c.extra_entities .. "mods/everythingUP/files/modifiers/magnet_shot_attract.xml,"
		c.fire_rate_wait = c.fire_rate_wait + 2
		
		draw_actions( 1, true )
	end,
} )
table.insert( actions, --MAGNET_SHOT_REPULSE
{
	id          = "MAGNET_SHOT_REPULSE",
	name 		= "$action_magnet_shot_repulse",
	description = "$actiondesc_magnet_shot_repulse",
	sprite 		= "mods/speed_embryo_horror_mod/files/cards_gfx/magnet_shot_repulse.xml,",
	sprite_unidentified = "",
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "0,1,2,3,4,5",
	spawn_probability                 = "0.3,0.8,0.8,0.8,0.8,0.8",
	price = 50,
	mana = 10,
	action 		= function()
		c.extra_entities = c.extra_entities .. "mods/everythingUP/files/modifiers/magnet_shot_repulse.xml,"
		c.fire_rate_wait = c.fire_rate_wait + 2
		
		draw_actions( 1, true )
	end,
} )