table.insert( actions,
{
	id          = "MAGNET_SHOT_ATTRACT",
	name 		= "Magnet Shot (Attract)",
	description = "Projectiles attract other magnetic projectiles",
	sprite 		= "mods/speed_embryo_horror_mod/files/actions/gfx/magnet_shot_attract.png",
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
	sprite 		= "mods/speed_embryo_horror_mod/files/actions/gfx/magnet_shot_repulse.png",
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
table.insert( actions,
{
	id          = "STAKE",
	name 		= "Stake",
	description = "Attaches to enemies",
	sprite 		= "mods/speed_embryo_horror_mod/files/actions/gfx/stake.png",
	sprite_unidentified = "",
	related_projectiles	= {"mods/speed_embryo_horror_mod/files/entities/projectiles/stake.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "1,2,3,4",
	spawn_probability                 = "1,0.6,0.4,1",
	price = 75,
	mana = 30,
	action 		= function()
		add_projectile("mods/speed_embryo_horror_mod/files/entities/projectiles/stake.xml")
		c.fire_rate_wait = c.fire_rate_wait + 25
		shot_effects.recoil_knockback = 40.0
	end,
} )
table.insert( actions,
{
	id          = "5G_RAY",
		name 		= "5g ray",
		description = "5G will be used as a way to control the people. Uranium",
		sprite 		= "mods/speed_embryo_horror_mod/files/actions/gfx/magnet_shot_repulse.png",
		sprite_unidentified = "",
		related_projectiles	= {"mods/speed_embryo_horror_mod/files/entities/projectiles/5g_ray.xml"},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "0,1,2", -- 5G_RAY
		spawn_probability                 = "2,1,0.5", -- 5G_RAY
		price = -5,
		mana = 20,
		--max_uses = -1,
		action 		= function()
			add_projectile("mods/speed_embryo_horror_mod/files/entities/projectiles/5g_ray.xml")
			c.fire_rate_wait = c.fire_rate_wait + 5
			c.screenshake = c.screenshake + 1
			c.spread_degrees = c.spread_degrees - 0
			c.damage_critical_chance = c.damage_critical_chance + 5
		end,
} )