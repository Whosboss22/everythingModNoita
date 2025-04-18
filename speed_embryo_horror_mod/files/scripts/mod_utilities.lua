dofile_once("data/scripts/lib/utilities.lua")

local mod_utils = {}

function mod_utils.Atan2pi(y, x)
    local rads = math.atan(y / x)
    if x < 0 then
        rads = rads + math.pi
    elseif y < 0 then
        rads = rads + 2 * math.pi
    end
    return rads
end

function mod_utils.UpdateDurationEffectStatus(effect_id, effect_name, previous_frames, currentFrames)
    dofile_once("data/scripts/status_effects/status_list.lua")
    local status_effect = nil
    local highest_min_threshold = 0
    local max_threshold = nil
    for _,v in ipairs(status_effects) do
        if v.id == effect_name then
            local min_threshold = v.min_threshold_normalized or 0
            min_threshold = min_threshold * 6000
            if currentFrames >= min_threshold then
                status_effect = v
                highest_min_threshold = min_threshold
            else
                max_threshold = min_threshold
                break
            end
        end
    end
    if status_effect == nil then return end

    if highest_min_threshold >= previous_frames or (max_threshold ~= nil and previous_frames >= max_threshold) then
        --change status
        local entity_id = EntityGetRootEntity(effect_id)
        EntityKill(effect_id)
        effect_id = LoadGameEffectEntityTo(entity_id, status_effect.effect_entity)
        local effectComp = EntityGetFirstComponentIncludingDisabled(effect_id, "GameEffectComponent")
        ComponentSetValue2(effectComp, "frames", currentFrames)

        EntityAddComponent2(effect_id, "UIIconComponent", {
            name = status_effect.ui_name,
            description = status_effect.ui_description,
            icon_sprite_file = status_effect.ui_icon,
            display_above_head = false,
            display_in_hud = true,
            is_perk = false,
        })
    end
end

function mod_utils.ApplyDurationBasedEffect(eid, effect_name, frames, displaysInUI)
    displaysInUI = displaysInUI or false

    --checks if the effect was already applied
    local effectComp = nil
    local effect_id = nil
    local currentFrames = 0
    local children = EntityGetAllChildren(eid)
    if children ~= nil then
        for _,c in ipairs(children) do
            local comp = EntityGetFirstComponentIncludingDisabled(c, "GameEffectComponent")

            if comp ~= nil and (ComponentGetValue2(comp, "custom_effect_id") == effect_name or ComponentGetValue2(comp, "effect") == effect_name) then
                effectComp = comp
                effect_id = c
                currentFrames = ComponentGetValue2(comp, "frames")
                break
            end
        end
    end

    if effectComp == nil then
        dofile_once("data/scripts/status_effects/status_list.lua")
        local status_effect = nil
        for _,v in ipairs(status_effects) do
            if v.id == effect_name and v.min_threshold_normalized == nil or v.min_threshold_normalized == 0 then
                status_effect = v
            end
        end

        effect_id = LoadGameEffectEntityTo(eid, status_effect.effect_entity)
        effectComp = EntityGetFirstComponentIncludingDisabled(effect_id, "GameEffectComponent")
        ComponentSetValue2(effectComp, "frames", frames)

        EntityAddComponent2(effect_id, "UIIconComponent", {
            name = status_effect.ui_name,
            description = status_effect.ui_description,
            icon_sprite_file = status_effect.ui_icon,
            display_above_head = false,
            display_in_hud = true,
            is_perk = false,
        })
    else
        ComponentSetValue2(effectComp, "frames", currentFrames + frames)
    end
end

function mod_utils.IsEntityHoldingPerk(eid, perk_name)
    local children = EntityGetAllChildren(eid)
    for _,c in ipairs(children) do
        local comp = EntityGetFirstComponentIncludingDisabled(c, "GameEffectComponent")
        
        comp = EntityGetFirstComponentIncludingDisabled(c, "GameEffectComponent")
        --print(ComponentGetValue2(comp, "effect"), ComponentGetValue2(comp, "custom_effect_id"))
        if comp ~= nil and ComponentGetValue2(comp, "effect") == perk_name then
            return true
        end
    end
    return false
end

function mod_utils.GetEntityHealthPercentage(eid, percentage)
    local comp = EntityGetFirstComponent( eid, "DamageModelComponent" );
    local max_hp = ComponentGetValue2( comp, "max_hp" );
    return max_hp * percentage
end

return mod_utils