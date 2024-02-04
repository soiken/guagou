function action_path(target)
  -- Determine whether the target is a room ID (numeric) or an area name (non-numeric)
  local isRoomId = tonumber(target) ~= nil

  if isRoomId then
    -- Target is a room ID, send path command for room
    send("PATH TRACK " .. target)
    cecho("<yellow>going to <reset>" .. target.. "\n")
  else
    -- Target is an area name, send path command for area
    send("PATH TRACK " .. target)
    cecho("<yellow>Going to <reset>" .. target.. "\n")
  end
  
  tempTimer(3, [[ echo("this is timer #1 going off 3s after being made\n") ]])

  -- Function to check if the character has arrived at the target location
  local function checkArrival()
    local currentArea = gmcp.Room.Info.area
    local currentRoomId = tostring(gmcp.Room.Info.num)
    local hasArrived = false

    if isRoomId then
      -- Check if current room ID matches target room ID
      hasArrived = currentRoomId:find(target)
    else
      -- Check if target area name partially matches current area name (case-insensitive)
      hasArrived = target:lower():find(currentArea:lower(), 1, true)
    end

    if hasArrived then
      -- Unregister the event handler to stop checking for arrival
      killAnonymousEventHandler(checkArrivalHandler)
      -- arrival message
      cecho("<yellow>Arrived <reset>" .. target.."\n")
      -- Advance to the next quest step
      cecho("<yellow>Advance Quest Step <reset>\n")
      advanceQuestStep()
      checkQuestProgress()
    end
  end

  -- Register the event handler to continuously check for arrival
  -- Note: You need to ensure 'gmcp.Room.Info' is correctly subscribed and handled in your Mudlet profile
  checkArrivalHandler = registerAnonymousEventHandler("gmcp.Room.Info", checkArrival)
end
