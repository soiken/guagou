function action_search_npc(npcName, area)
  -- Call mobDB.lookupArea to get NPC data for the area
  local areaData = mobDB.lookupArea(area)
  
  -- Check if areaData is not nil and has at least one entry
  if areaData and #areaData > 0 then
    local mobs = areaData[1].mobs -- Access the mobs array in the first entry
    local foundNpc = false

    -- Iterate through the mobs array to find the NPC
    for _, npc in ipairs(mobs) do
      if npc.name == npcName then
        foundNpc = true
        -- If NPC is found, navigate to the NPC's roomId
        action_path(tostring(npc.roomId)) -- Convert roomId to string if necessary
        break
      end
    end

    if not foundNpc then
      echo("NPC '"..npcName.."' not found in area '"..area.."'.\n")
    end
  else
    echo("No NPC data found for area '"..area.."'.\n")
  end
end
