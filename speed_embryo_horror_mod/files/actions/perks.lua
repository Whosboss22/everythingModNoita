table.insert (perk_list,
    {
        id = "DMG_STORING",
        ui_name = "Procrastination armor",
        ui_description = "Future consequences...",
        not_in_default_perk_pool = false, --Set this to false if you want it to spawn with the normal perks
        ui_icon = "mods/speed_embryo_horror_mod/files/actions/gfx/damage_storing_icon.png", --UI icon
        perk_icon = "mods/speed_embryo_horror_mod/files/actions/gfx/damage_storing_icon.png", --In-world sprite
        stackable = STACKABLE_NO, --if this perk can be stacked
        func = function( entity_perk_item, entity_who_picked, item_name, pickup_count )
            EntityAddComponent(
                entity_who_picked,
                
                "LuaComponent", { 
                    _tags = "perk_component",
                    script_damage_about_to_be_received="mods/speed_embryo_horror_mod/files/scripts/damage_script.lua",
                    script_damage_received="mods/speed_embryo_horror_mod/files/scripts/damage_script.lua" } )

            EntityAddComponent( entity_who_picked, "VariableStorageComponent", { _tags="CURSED_DAMAGE_PERKS,perk_component" } )
        end
    }
)
