dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local velComp = EntityGetFirstComponent(entity_id, "VelocityComponent")
local vx, vy = ComponentGetValue2(velComp, "mVelocity")

local varComp = EntityGetFirstComponent(entity_id, "VariableStorageComponent")
local detector_id = ComponentGetValue2(varComp, "value_int")

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)

local x1 = x + vx
local y1 = y + vy

local is_detector_alive = EntityGetIsAlive(detector_id)
if (is_detector_alive == false) then
    GamePrint("hi uwu")

	if (#EntityGetInRadiusWithTag(x, y, 30, "mortal") == 0) then
		EntityKill(entity_id)
		return
	end

    local closest_entity_id = EntityGetClosestWithTag(x, y, "mortal")
    EntityAddChild(closest_entity_id, entity_id)

    local luaComp = EntityGetFirstComponent(entity_id, "LuaComponent")
    EntityRemoveComponent(entity_id, luaComp)

    local projComp = EntityGetFirstComponent(entity_id, "ProjectileComponent")
    ComponentSetValue2( projComp, "damage", 0 )
    ComponentSetValue2( projComp, "lifetime", math.ceil(ComponentGetValue2(projComp, "mStartingLifetime") / 3) )
    ComponentObjectSetValue2( projComp, "damage_by_type", "projectile", 0 )
	ComponentObjectSetValue2( projComp, "damage_by_type", "electricity", 0 )
	ComponentObjectSetValue2( projComp, "damage_by_type", "explosion", 0 )
	ComponentObjectSetValue2( projComp, "damage_by_type", "fire", 0 )
	ComponentObjectSetValue2( projComp, "damage_by_type", "melee", 0 )
	ComponentObjectSetValue2( projComp, "damage_by_type", "drill", 0 )
	ComponentObjectSetValue2( projComp, "damage_by_type", "slice", 0 )
	ComponentObjectSetValue2( projComp, "damage_by_type", "ice", 0 )
	ComponentObjectSetValue2( projComp, "damage_by_type", "healing", 0 )
	ComponentObjectSetValue2( projComp, "damage_by_type", "physics_hit", 0 )
	ComponentObjectSetValue2( projComp, "damage_by_type", "radioactive", 0 )
	ComponentObjectSetValue2( projComp, "damage_by_type", "poison", 0 )
	ComponentObjectSetValue2( projComp, "damage_by_type", "overeating", 0 )
	ComponentObjectSetValue2( projComp, "damage_by_type", "curse", 0 )

    EntityRemoveComponent(entity_id, velComp)
end