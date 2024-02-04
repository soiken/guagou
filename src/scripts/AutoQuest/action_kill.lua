function action_kill()
  snd_bashArea() -- Assuming this function initiates the killing of all mobs in the area.

  -- Define the checkKillCompletion function inside action_kill to capture its scope.
  local function checkKillCompletion()
    local currentArea = gmcp.Room.Info.area or ""
    -- Convert both strings to lower case to ensure case-insensitive comparison.
    if currentArea:lower() == "\"spinesreach\"" then
      -- Once back in Spinesreach, unregister the event handler to stop checking.
      killAnonymousEventHandler(handlerId)
      -- Then advance to the next quest step.
      advanceQuestStep()
    end
  end

  -- Register the event handler and keep its ID for later cleanup.
  -- Note: This assumes handlerId is declared globally or at a higher scope.
  handlerId = registerAnonymousEventHandler("gmcp.Room.Info", checkKillCompletion)
end
