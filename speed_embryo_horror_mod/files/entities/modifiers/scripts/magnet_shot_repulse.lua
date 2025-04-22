dofile_once("data/scripts/lib/utilities.lua")
local mod_utils = dofile_once("mods/speed_embryo_horror_mod/files/scripts/mod_utilities.lua")

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )

if (EntityHasTag(entity_id, "magnet_shot_applied") == false) then
	EntityAddTag(entity_id, "magnet_shot_applied")
end

--getting entities with magnet shot applied
local target_entities = EntityGetWithTag("magnet_shot_applied")
if (target_entities == nil or #target_entities == 0) then return end --guard

--getting net acceleration over all entities
local magnet_coefficient = -10000000000
local netAccelX = 0
local netAccelY = 0
for i=1, #target_entities do
	local entity_x, entity_y = EntityGetTransform( target_entities[i] )
	local dx = entity_x - x
	local dy = entity_y - y

	if (dx ~= 0) then
		local dir = mod_utils.Atan2pi(dy, dx)
		local dist = math.sqrt(dx^2 + dy^2)
		local accel_magnitude = math.max(-2000, math.min(magnet_coefficient / dist^3, 2000))

		netAccelX = netAccelX + accel_magnitude * math.cos(dir)
		netAccelY = netAccelY + accel_magnitude * math.sin(dir)
	end
end

--computing changes in velocities
local dt = 0.01
local dvx = netAccelX * dt
local dvy = netAccelY * dt

--applying new velocities
local comp = EntityGetFirstComponent( entity_id, "VelocityComponent")
if (comp == nil) then return end
local vel_x, vel_y = ComponentGetValueVector2( comp, "mVelocity" )
ComponentSetValueVector2( comp, "mVelocity", vel_x + dvx, vel_y + dvy )