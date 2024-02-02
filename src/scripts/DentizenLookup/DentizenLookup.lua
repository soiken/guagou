function mobDB.lookupArea(toCheck)
    local area = toCheck
    local result = {} -- Initialize an empty array to store the results
  
    for mdbArea, mdbMobs in spairs(mobDB.info.mobs) do
      if string.starts(mdbArea:lower(), area:lower()) or string.find(mdbArea:lower(), area:lower()) then
        local areaInfo = { name = mdbArea, mobs = {} } -- Create an area info table
        for mob, vnum in spairs(mobDB.info.mobs[mdbArea]) do
          local mobInfo = { name = mob, roomId = vnum }
          table.insert(areaInfo.mobs, mobInfo) -- Add mob info to the area info
        end
        table.insert(result, areaInfo) -- Add area info to the result
      end
    end
  
    return result -- Return the result array
  end