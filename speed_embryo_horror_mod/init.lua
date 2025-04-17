dofile_once( "data/scripts/lib/utilities.lua" )

-- all functions below are optional and can be left out

--[[

function OnModPreInit()
	print("Mod - OnModPreInit()") -- First this is called for all mods
end

function OnModInit()
	print("Mod - OnModInit()") -- After that this is called for all mods
end

function OnModPostInit()
	print("Mod - OnModPostInit()") -- Then this is called for all mods
end

function OnPlayerSpawned( player_entity ) -- This runs when player entity has been created
	GamePrint( "OnPlayerSpawned() - Player entity id: " .. tostring(player_entity) )
end

function OnWorldInitialized() -- This is called once the game world is initialized. Doesn't ensure any world chunks actually exist. Use OnPlayerSpawned to ensure the chunks around player have been loaded or created.
	GamePrint( "OnWorldInitialized() " .. tostring(GameGetFrameNum()) )
end

function OnWorldPreUpdate() -- This is called every time the game is about to start updating the world
	GamePrint( "Pre-update hook " .. tostring(GameGetFrameNum()) )
end

function OnWorldPostUpdate() -- This is called every time the game has finished updating the world
	GamePrint( "Post-update hook " .. tostring(GameGetFrameNum()) )
end
]]--

function OnModPreInit()
--!!TRANSLATIONS (dont edit)!!
	local actions_enhanced = dofile("mods/speed_embryo_horror_mod/files/scripts/actions_enhanced.lua")
	for _, value in ipairs(actions_enhanced) do
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" .. [[
		]].. "action_" .. value.id ..[[,]] .. value.name .. [[,,,,,,,,,,,,,
		]].. "actiondesc_" .. value.id ..[[,]] .. value.description .. [[,,,,,,,,,,,,,
		]])

		ModTextFileSetContent("data/translations/common.csv", ModTextFileGetContent("data/translations/common.csv") .. [[
		]].. "action_" .. value.id ..[[,]] .. value.name .. [[,,,,,,,,,,,,,
		]].. "actiondesc_" .. value.id ..[[,]] .. value.description .. [[,,,,,,,,,,,,,
		]])
	end
end

--!!FILE APPENDS!!
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/speed_embryo_horror_mod/files/scripts/actions_enhanced.lua" )

GamePrint("SPEED EMBRYO HORROR MOD initialized!")