table.insert( actions,
{
	id          = "MAGNET_SHOT_ATTRACT",
	name 		= "Magnet Shot (Attract)",
	description = "Projectiles attract other magnetic projectiles",
	sprite 		= "mods/speed_embryo_horror_mod/files/cards_gfx/magnet_shot_attract.png",
	sprite_unidentified = "",
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "0,1,2,3,4,5",
	spawn_probability                 = "0.3,0.8,0.8,0.8,0.8,0.8",
	price = 50,
	mana = 10,
	action 		= function()
		c.extra_entities = c.extra_entities .. "mods/speed_embryo_horror_mod/files/entities/modifiers/magnet_shot_attract.xml,"
		c.fire_rate_wait = c.fire_rate_wait + 3
		
		draw_actions( 1, true )
	end,
} )
table.insert( actions,
{
	id          = "MAGNET_SHOT_REPULSE",
	name 		= "Magnet Shot (Repulse)",
	description = "Projectiles repulse other magnetic projectiles",
	sprite 		= "mods/speed_embryo_horror_mod/files/cards_gfx/magnet_shot_repulse.png",
	sprite_unidentified = "",
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "0,1,2,3,4,5",
	spawn_probability                 = "0.3,0.8,0.8,0.8,0.8,0.8",
	price = 50,
	mana = 10,
	action 		= function()
		c.extra_entities = c.extra_entities .. "mods/speed_embryo_horror_mod/files/entities/modifiers/magnet_shot_repulse.xml,"
		c.fire_rate_wait = c.fire_rate_wait + 3
		
		draw_actions( 1, true )
	end,
} )