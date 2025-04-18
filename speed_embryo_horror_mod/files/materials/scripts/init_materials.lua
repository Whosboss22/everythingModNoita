dofile_once("data/scripts/lib/utilities.lua")

local nxml = dofile_once("mods/speed_embryo_horror_mod/lib/nxml.lua")
local content = ModTextFileGetContent("data/materials.xml")
local xml = nxml.parse(content)

--ADD NEW MATERIALS

--EDIT EXISTING MATERIALS

--accursed scripts
for element in xml:each_child() do if element.attr.ui_name == "$mat_radioactive_liquid" then for element2 in element:each_child() do for element3 in element2:each_child() do if element3.name == "Ingestion" then for status_effect in element3:each_child() do
  status_effect.attr.type = "INGESTION_RADIATION"
  status_effect.attr.amount = 0.1
end end end end end end
ModTextFileSetContent("data/materials.xml", tostring(xml))