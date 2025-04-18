dofile_once("data/scripts/lib/utilities.lua")
local mod_utils = dofile_once("mods/speed_embryo_horror_mod/files/scripts/mod_utilities.lua")

local entity_id = GetUpdatedEntityID()
entity_id = EntityGetRootEntity(entity_id)

mod_utils.ApplyDurationBasedEffect(entity_id, "IRRADIATED", 5, true)