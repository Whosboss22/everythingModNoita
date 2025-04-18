dofile_once("data/scripts/lib/utilities.lua")
local mod_utils = dofile_once("mods/speed_embryo_horror_mod/files/scripts/mod_utilities.lua")

local effect_id = GetUpdatedEntityID()

local varComp = EntityGetFirstComponentIncludingDisabled(effect_id, "VariableStorageComponent")
local previous_frames = ComponentGetValueInt(varComp, "value_int")

local comp = EntityGetFirstComponentIncludingDisabled(effect_id, "GameEffectComponent")
if comp == nil then return end
local currentFrames = ComponentGetValue2(comp, "frames")

if previous_frames ~= 0 then
    mod_utils.UpdateDurationEffectStatus(effect_id, "IRRADIATED", previous_frames, currentFrames)
end

ComponentSetValue2(varComp, "value_int", currentFrames)