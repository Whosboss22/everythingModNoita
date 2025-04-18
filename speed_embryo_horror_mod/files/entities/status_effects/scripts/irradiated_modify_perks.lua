dofile( "data/scripts/game_helpers.lua" )
dofile_once("data/scripts/lib/utilities.lua")
local mod_utils = dofile_once("mods/speed_embryo_horror_mod/files/scripts/mod_utilities.lua")
dofile_once( "data/scripts/perks/perk_list.lua" )
dofile( "data/scripts/perks/perk.lua" )

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )
local root_entity_id = EntityGetRootEntity(entity_id)

if mod_utils.IsEntityHoldingPerk(root_entity_id, "PROTECTION_RADIOACTIVITY") then return end

SetRandomSeed( x, y )

--add perk
local availablePerks = {}
for _,v in ipairs(perk_list) do
    if IsPlayer(root_entity_id) then
        if v.not_in_default_perk_pool == nil and v.one_off_effect == nil then
            table.insert(availablePerks, v)
        end
    else
        if v.not_in_default_perk_pool == nil and v.one_off_effect == nil and v.usable_by_enemies ~= nil then
            table.insert(availablePerks, v)
        end
    end
end

local perk_id = availablePerks[Random(1, #availablePerks)].id
perk_pickup( 0, root_entity_id, perk_id, false, false, true )

local damage = math.min(mod_utils.GetEntityHealthPercentage(root_entity_id, 0.2), 2000)
EntityInflictDamage(root_entity_id, damage, "DAMAGE_RADIOACTIVE", "Radiation", "NORMAL", 0, 0)