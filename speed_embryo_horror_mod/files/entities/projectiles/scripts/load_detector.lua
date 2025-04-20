dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)

local detector_id = EntityLoad("mods/speed_embryo_horror_mod/files/entities/projectiles/detector.xml", x, y)
EntityAddChild(entity_id, detector_id)

ComponentSetValue2(EntityGetFirstComponent(entity_id, "VariableStorageComponent"), "value_int", detector_id)