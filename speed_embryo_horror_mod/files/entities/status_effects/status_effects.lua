table.insert(status_effects, {
    id="IRRADIATED",
	ui_name="Irradiated",
	ui_description="Your skin is tingling.",
	ui_icon="mods/speed_embryo_horror_mod/files/entities/status_effects/gfx/irradiated.png",
	effect_entity="mods/speed_embryo_horror_mod/files/entities/status_effects/irradiated.xml",
	is_harmful=true,
})
table.insert(status_effects, {
    id="IRRADIATED",
	ui_name="Severely Irradiated",
	ui_description="Your body melts and shifts.",
	ui_icon="mods/speed_embryo_horror_mod/files/entities/status_effects/gfx/irradiated.png",
	effect_entity="mods/speed_embryo_horror_mod/files/entities/status_effects/irradiated_mutating.xml",
    min_threshold_normalized="1.0",
	is_harmful=true,
})
table.insert(status_effects, {
    id="INGESTION_RADIATION",
	ui_name="Ingested Toxic Sludge",
	ui_description="You feel... Energized.",
	ui_icon="mods/speed_embryo_horror_mod/files/entities/status_effects/gfx/irradiated.png",
	effect_entity="mods/speed_embryo_horror_mod/files/entities/status_effects/ingestion_radiation.xml",
	is_harmful=true,
})